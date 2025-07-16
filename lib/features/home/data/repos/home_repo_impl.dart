import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_error_model.dart';
import 'package:marketi/features/home/data/models/brand_model.dart';
import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../data_resources/home_local_data.dart';
import '../data_resources/home_remote_data.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeLocalData homeLocalData;
  final HomeRemoteData homeRemoteData;

  HomeRepoImpl(this.homeLocalData, this.homeRemoteData);
  @override
  Future<Either<ApiErrorModel, List<ProductModel>>> getProducts() async {
    try {
      var products = homeLocalData.getProducts();
      if (products.isNotEmpty) {
        return Right(products);
      } else {
        var remoteProducts = await homeRemoteData.getProducts();
        return Right(remoteProducts);
      }
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<CategoryModel>>> getCategories() async {
    try {
      var categories = homeLocalData.getCategories();
      if (categories.isNotEmpty) {
        return Right(categories);
      } else {
        var remoteCategories = await homeRemoteData.getCategories();
        return Right(remoteCategories);
      }
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<BrandModel>>> getBrands() async {
    try {
      var brands = homeLocalData.getBrands();
      if (brands.isNotEmpty) {
        return Right(brands);
      } else {
        var remoteBrands = await homeRemoteData.getBrands();
        return Right(remoteBrands);
      }
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }
}
