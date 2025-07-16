import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_error_model.dart';
import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../data_resources/cart_local_data.dart';
import '../data_resources/cart_remote_data.dart';
import '../models/cart_model.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiService _apiService;
  final CartRemoteData _cartRemoteData;
  final CartLocalData _cartLocalData;
  CartRepoImpl(this._apiService, this._cartRemoteData, this._cartLocalData);
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
  Future<Either<ApiErrorModel, List<CartModel>>> getCart() async {
    try {
      var cartItems = _cartLocalData.getCart();
      if (cartItems.isNotEmpty) {
        return Right(cartItems);
      } else {
        var remoteCartItems = await _cartRemoteData.getCart();
        return Right(remoteCartItems);
      }
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
