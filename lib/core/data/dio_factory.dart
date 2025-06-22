import 'package:dio/dio.dart';
import 'package:marketi/core/data/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'cache_helper.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio({String? baseUrl}) async {
    const Duration timeOut = Duration(seconds: 40);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = baseUrl ?? ApiConstants.apiBaseUrl
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      await addDioHeaders();
      addDioInterceptor();
      return dio!;
    }
    return dio!;
  }

  static Future<void> addDioHeaders() async {
    final token = await CacheHelper.getSecureData(key: 'token');
    dio?.options.headers = {
      'Accept': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void clearToken() {
    dio?.options.headers.remove('Authorization');
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}
