import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/model/user_data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(password: password, email: email);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(LoginError(e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginError(e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SingupLoading());
    try {
      await client.auth.signUp(password: password, email: email);
      await addUserData(name: name, email: email);
      emit(SingupSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(SingupError(e.message));
    } catch (e) {
      log(e.toString());
      emit(SingupError(e.toString()));
    }
  }

  GoogleSignInAccount? googleUser;

  Future<AuthResponse> googleSignIn() async {
    emit(GoogleSignInLoading());

    try {
      await dotenv.load(fileName: '.env');

      final String webClientId = dotenv.get('GOOGLE_CLIENT_ID');

      // Get Google Sign-In singleton instance
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      // Initialize Google Sign-In
      await googleSignIn.initialize(serverClientId: webClientId);

      // Authenticate with Google
      googleUser = await googleSignIn.authenticate();

      // Get Google authentication data
      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

      // Get ID Token
      final String? idToken = googleAuth.idToken;

      // Check ID Token
      if (idToken == null) {
        emit(GoogleSignInError('ID token is null.'));

        return AuthResponse();
      }

      // Sign in to Supabase using Google ID Token
      final AuthResponse response = await Supabase.instance.client.auth
          .signInWithIdToken(provider: OAuthProvider.google, idToken: idToken);

      // Add user data to your database
      await addUserData(
        name: googleUser!.displayName ?? '',
        email: googleUser!.email,
      );

      emit(GoogleSignInSuccess());

      return response;
    } catch (e, stackTrace) {
      log('Google Sign-In Error: $e', stackTrace: stackTrace);

      emit(GoogleSignInError(e.toString()));

      return AuthResponse();
    }
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await client.auth.signOut();
      emit(SignOutSuccess());
    } catch (e) {
      log(e.toString());
      emit(SignOutError(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(PasswordResetLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(PasswordResetSuccess());
    } catch (e) {
      log(e.toString());
      emit(PasswordResetError(e.toString()));
    }
  }

  Future<void> addUserData({
    required String name,
    required String email,
  }) async {
    emit(UserDataAddedLoading());

    try {
      final currentUser = client.auth.currentUser;

      if (currentUser == null) {
        emit(UserDataAddedError());
        return;
      }

      await client.from('user').upsert({
        'id': currentUser.id,
        'name': name,
        'email': email,
      }, onConflict: 'id');

      emit(UserDataAddedSuccess());
    } catch (e, stackTrace) {
      log('Add User Data Error: $e', stackTrace: stackTrace);

      emit(UserDataAddedError());
    }
  }

  UserDataModel? userDataModel;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final data = await client
          .from('user')
          .select()
          .eq('id', client.auth.currentUser!.id);
      log(data.toString());
      userDataModel = UserDataModel(
        name: data[0]['name'],
        email: data[0]['email'],
        id: data[0]['id'],
      );
      emit(GetUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetUserDataError());
    }
  }
}
