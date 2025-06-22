import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_error_model.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/errors/api_error_handler.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);
  @override
  Future<Either<ApiErrorModel, List<ProductModel>>> getProducts() async {
    try {
      var data = await _apiService.get(endPoint: ApiConstants.products);
      List<ProductModel> products =
          (data['list'] as List)
              .map((item) => ProductModel.fromJson(item))
              .toList();
      return Right(products);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }
}
