import 'package:dartz/dartz.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../home/data/models/product_model.dart';

abstract class FavRepo {
  Future<Either<ApiErrorModel, String>> addFav({required String productId});
  Future<Either<ApiErrorModel, String>> removeFav({required String productId});
  Future<Either<ApiErrorModel, List<ProductModel>>> getFav();
}
