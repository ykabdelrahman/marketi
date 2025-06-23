import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/view_model/categories/categories_cubit.dart';
import '../../features/home/presentation/view_model/products/products_cubit.dart';
import '../data/api_service.dart';
import '../data/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // auth
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));
}
