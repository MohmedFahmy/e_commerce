import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/model/user_data.dart';
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
    const webClientId =
        '489201623830-oudcmv0b8u0621tnpsts2dvnpsgtn6d4.apps.googleusercontent.com';

    /// const androidClientId = 'my-android.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId: androidClientId,
      serverClientId: webClientId,
    );

    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(GoogleSignInError('Access token or ID token is null.'));
      return AuthResponse();
    }

    AuthResponse response = await Supabase.instance.client.auth
        .signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken,
        );
    await addUserData(name: googleUser!.displayName!, email: googleUser!.email);
    emit(GoogleSignInSuccess());
    return response;
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
      await client.from('users').upsert({
        'id': client.auth.currentUser!.id,
        'name': name,
        'email': email,
      });
      emit(UserDataAddedSuccess());
    } catch (e) {
      log(e.toString());
      emit(UserDataAddedError());
    }
  }

  UserDataModel? userDataModel;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final data = await client
          .from('users')
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
