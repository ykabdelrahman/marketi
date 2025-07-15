import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_error_model.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/errors/api_error_handler.dart';
import 'fav_repo.dart';

class FavRepoImpl implements FavRepo {
  final ApiService _apiService;

  FavRepoImpl(this._apiService);
  @override
  Future<Either<ApiErrorModel, String>> addFav({
    required String productId,
  }) async {
    try {
      var response = await _apiService.post(
        endPoint: ApiConstants.addFav,
        data: {'productId': productId},
      );
      return Right(response['message']);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<ProductModel>>> getFav() async {
    try {
      var data = await _apiService.get(endPoint: ApiConstants.getFav);
      List<ProductModel> products =
          (data['list'] as List)
              .map((item) => ProductModel.fromJson(item))
              .toList();
      return Right(products);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> removeFav({
    required String productId,
  }) async {
    try {
      var response = await _apiService.post(
        endPoint: ApiConstants.removeFav,
        data: {'productId': productId},
      );
      return Right(response['message']);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }
}
