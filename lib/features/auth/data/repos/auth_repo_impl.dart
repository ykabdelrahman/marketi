import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:marketi/core/data/api_constants.dart';
import 'package:marketi/features/auth/data/models/user_model.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/data/cache_helper.dart';
import '../../../../core/data/dio_factory.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/utils/constants.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/signup_request.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<ApiErrorModel, String>> signUp(
    SignupRequest signupRequest,
  ) async {
    try {
      var data = await apiService.post(
        endPoint: ApiConstants.signup,
        data: signupRequest.toJson(),
      );

      return Right(data['message']);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, LoginResponse>> login(
    LoginRequest loginRequest,
  ) async {
    try {
      var data = await apiService.post(
        endPoint: ApiConstants.login,
        data: loginRequest.toJson(),
      );
      final loginResponse = LoginResponse.fromJson(data);
      await saveUserToken(loginResponse.token);
      await getUser();
      return Right(loginResponse);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, void>> getUser() async {
    try {
      var data = await apiService.get(endPoint: ApiConstants.getUser);

      final box = Hive.box<UserModel>(Constants.userBox);
      box.put('user', UserModel.fromJson(data));
      return Right(null);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }

  Future<void> saveUserToken(String token) async {
    await CacheHelper.setSecureData(key: Constants.tokenKey, value: token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
