import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_error_model.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../home/data/models/product_model.dart';
import '../data_resources/cart_local_data.dart';
import '../data_resources/cart_remote_data.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteData _cartRemoteData;
  final CartLocalData _cartLocalData;
  CartRepoImpl(this._cartRemoteData, this._cartLocalData);

  @override
  Future<Either<ApiErrorModel, List<ProductModel>>> getCart() async {
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
  Future<Either<ApiErrorModel, String>> addCart({
    required ProductModel product,
  }) async {
    try {
      await _cartLocalData.addToCart(product);
      var response = await _cartRemoteData.addToCart(product);
      return Right(response);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> removeCart({
    required String productId,
  }) async {
    try {
      await _cartLocalData.removeFromCart(productId);
      var response = await _cartRemoteData.removeFromCart(productId);
      return Right(response);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }
}
