import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/api_service.dart';
import '../data/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}
