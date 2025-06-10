import 'package:dartz/dartz.dart';
import 'package:marketi/core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
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

      return Right(LoginResponse.fromJson(data));
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }
}
