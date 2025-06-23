import 'package:dartz/dartz.dart';
import '../../../../core/errors/api_error_model.dart';
import '../models/category_mode.dart';
import '../models/product_model.dart';

abstract class HomeRepo {
  Future<Either<ApiErrorModel, List<ProductModel>>> getProducts();

  Future<Either<ApiErrorModel, List<CategoryModel>>> getCategories();
}
