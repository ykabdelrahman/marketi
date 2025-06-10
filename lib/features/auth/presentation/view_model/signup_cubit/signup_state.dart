part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final String message;

  SignupSuccess(this.message);
}

final class SignupFailure extends SignupState {
  final String error;

  SignupFailure(this.error);
}

final class PasswordEyeTap extends SignupState {}

final class ConfirmPasswordEyeTap extends SignupState {}
