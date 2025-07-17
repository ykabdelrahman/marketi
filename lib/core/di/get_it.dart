import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import '../../features/cart/data/data_resources/cart_local_data.dart';
import '../../features/cart/data/data_resources/cart_remote_data.dart';
import '../../features/cart/data/repos/cart_repo.dart';
import '../../features/cart/data/repos/cart_repo_impl.dart';
import '../../features/cart/presentation/view_model/cart/cart_cubit.dart';
import '../../features/fav/data/data_resources/fav_local_data.dart';
import '../../features/fav/data/data_resources/fav_remote_data.dart';
import '../../features/fav/data/repos/fav_repo.dart';
import '../../features/fav/data/repos/fav_repo_impl.dart';
import '../../features/fav/presentation/view_model/fav/fav_cubit.dart';
import '../../features/home/data/data_resources/home_local_data.dart';
import '../../features/home/data/data_resources/home_remote_data.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/view_model/brands/brands_cubit.dart';
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
  getIt.registerLazySingleton<HomeRemoteData>(
    () => HomeRemoteDataImpl(getIt()),
  );
  getIt.registerLazySingleton<HomeLocalData>(() => HomeLocalDataImpl());
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt(), getIt()));
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));
  getIt.registerFactory<BrandsCubit>(() => BrandsCubit(getIt()));

  // cart
  getIt.registerLazySingleton<CartRemoteData>(
    () => CartRemoteDataImpl(getIt()),
  );
  getIt.registerLazySingleton<CartLocalData>(() => CartLocalDataImpl());
  getIt.registerLazySingleton<CartRepo>(() => CartRepoImpl(getIt(), getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));

  // fav
  getIt.registerLazySingleton<FavRemoteData>(() => FavRemoteDataImpl(getIt()));
  getIt.registerLazySingleton<FavLocalData>(() => FavLocalDataImpl());
  getIt.registerLazySingleton<FavRepo>(() => FavRepoImpl(getIt(), getIt()));
  getIt.registerFactory<FavCubit>(() => FavCubit(getIt()));
}
