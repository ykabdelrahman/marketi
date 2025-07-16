import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_error_model.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../data_resources/fav_local_data.dart';
import '../data_resources/fav_remote_data.dart';
import 'fav_repo.dart';

class FavRepoImpl implements FavRepo {
  final ApiService _apiService;
  final FavRemoteData _favRemoteData;
  final FavLocalData _favLocalData;

  FavRepoImpl(this._apiService, this._favRemoteData, this._favLocalData);
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
      var favItems = _favLocalData.getFav();
      if (favItems.isNotEmpty) {
        return Right(favItems);
      } else {
        var remoteFavItems = await _favRemoteData.getFav();
        return Right(remoteFavItems);
      }
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
