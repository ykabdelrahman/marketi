import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/cache_helper.dart';
import '../../../../../core/data/dio_factory.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/login_request.dart';
import '../../../data/repos/auth_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  LoginCubit(this._authRepo) : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoading());
    final loginModel = LoginRequest(
      email: email.text.trim(),
      password: password.text.trim(),
    );
    final results = await _authRepo.login(loginModel);
    results.fold((failure) => emit(LoginFailure(failure.message!)), (
      data,
    ) async {
      await saveUserToken(data.token);
      emit(LoginSuccess(data.message));
    });
  }

  Future<void> saveUserToken(String token) async {
    await CacheHelper.setSecureData(key: Constants.tokenKey, value: token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  void rememberCheckBox() {
    isChecked = !isChecked;
    emit(CheckBox());
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
