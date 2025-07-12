import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_error_model.dart';
import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../home/data/models/product_model.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiService _apiService;
  CartRepoImpl(this._apiService);
  @override
  Future<Either<ApiErrorModel, String>> addCart({
    required String productId,
  }) async {
    try {
      var response = await _apiService.post(
        endPoint: ApiConstants.addCart,
        data: {'productId': productId},
      );
      return Right(response['message']);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<ProductModel>>> getCart() async {
    try {
      var data = await _apiService.get(endPoint: ApiConstants.getCart);
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
  Future<Either<ApiErrorModel, String>> removeCart({
    required String productId,
  }) async {
    try {
      var response = await _apiService.delete(
        endPoint: ApiConstants.removeCart,
        data: {'productId': productId},
      );
      return Right(response['message']);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }
}
