import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/signup_request.dart';
import '../../../data/repos/auth_repo.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo _authRepo;
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordSecure = true;
  bool isConPasswordSecure = true;
  SignupCubit(this._authRepo) : super(SignupInitial());

  Future<void> signUp() async {
    emit(SignupLoading());
    final signupModel = SignupRequest(
      email: email.text.trim(),
      password: password.text.trim(),
      confirmPassword: confirmPassword.text.trim(),
      name: username.text.trim(),
      phone: phone.text.trim(),
    );
    final results = await _authRepo.signUp(signupModel);
    results.fold((failure) => emit(SignupFailure(failure.message!)), (success) {
      emit(SignupSuccess(success));
    });
  }

  onPasswordEyeTap() {
    isPasswordSecure = !isPasswordSecure;
    emit(PasswordEyeTap());
  }

  onConfirmPasswordEyeTap() {
    isConPasswordSecure = !isConPasswordSecure;
    emit(ConfirmPasswordEyeTap());
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    username.dispose();
    phone.dispose();
    return super.close();
  }
}
