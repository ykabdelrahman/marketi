import 'package:dartz/dartz.dart';
import '../../../../core/errors/api_error_model.dart';
import '../models/cart_model.dart';

abstract class CartRepo {
  Future<Either<ApiErrorModel, String>> addCart({required String productId});
  Future<Either<ApiErrorModel, String>> removeCart({required String productId});
  Future<Either<ApiErrorModel, List<CartModel>>> getCart();
}
