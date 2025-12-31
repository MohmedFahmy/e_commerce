part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginError extends AuthState {
  final String message;
  LoginError(this.message);
}

final class SingupSuccess extends AuthState {}

final class SingupLoading extends AuthState {}

final class SingupError extends AuthState {
  final String message;
  SingupError(this.message);
}

final class GoogleSignInSuccess extends AuthState {}

final class GoogleSignInLoading extends AuthState {}

final class GoogleSignInError extends AuthState {
  final String message;
  GoogleSignInError(this.message);
}

final class SignOutSuccess extends AuthState {}

final class SignOutLoading extends AuthState {}

final class SignOutError extends AuthState {
  final String message;
  SignOutError(this.message);
}

final class PasswordResetSuccess extends AuthState {}

final class PasswordResetLoading extends AuthState {}

final class PasswordResetError extends AuthState {
  final String message;
  PasswordResetError(this.message);
}

final class UserDataAddedSuccess extends AuthState {}

final class UserDataAddedLoading extends AuthState {}

final class UserDataAddedError extends AuthState {}

final class GetUserDataLoading extends AuthState {}

final class GetUserDataSuccess extends AuthState {}

final class GetUserDataError extends AuthState {}
