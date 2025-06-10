import 'package:dartz/dartz.dart';
import 'package:marketi/features/auth/data/models/login_request.dart';
import 'package:marketi/features/auth/data/models/login_response.dart';
import '../../../../core/errors/api_error_model.dart';
import '../models/signup_request.dart';

abstract class AuthRepo {
  Future<Either<ApiErrorModel, String>> signUp(SignupRequest signupRequest);

  Future<Either<ApiErrorModel, LoginResponse>> login(LoginRequest loginRequest);
}
