import 'package:dio/dio.dart';
import 'package:marketi/core/data/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await _dio.get(
      '${ApiConstants.apiBaseUrl}$endPoint',
      queryParameters: queryParams,
    );
    return response.data;
  }

  Future<dynamic> post({required String endPoint, dynamic data}) async {
    final response = await _dio.post(
      '${ApiConstants.apiBaseUrl}$endPoint',
      data: data,
    );
    return response.data;
  }

  Future<dynamic> put({required String endPoint, dynamic data}) async {
    final response = await _dio.put(
      '${ApiConstants.apiBaseUrl}$endPoint',
      data: data,
    );
    return response.data;
  }

  Future<dynamic> delete({required String endPoint, dynamic data}) async {
    final response = await _dio.delete(
      '${ApiConstants.apiBaseUrl}$endPoint',
      data: data,
    );
    return response.data;
  }

  Future<Response> uploadFile({
    required String endPoint,
    required String filePath,
    required String fileName,
    Map<String, dynamic>? additionalData,
  }) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath, filename: fileName),
      if (additionalData != null) ...additionalData,
    });

    return await post(endPoint: endPoint, data: formData);
  }
}
