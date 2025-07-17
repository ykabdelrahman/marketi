import 'package:dartz/dartz.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../home/data/models/product_model.dart';

abstract class CartRepo {
  Future<Either<ApiErrorModel, String>> addCart({
    required ProductModel product,
  });
  Future<Either<ApiErrorModel, String>> removeCart({required String productId});
  Future<Either<ApiErrorModel, List<ProductModel>>> getCart();
}
