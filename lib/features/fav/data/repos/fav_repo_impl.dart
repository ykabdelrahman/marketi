import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/api_error_model.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../data_resources/fav_local_data.dart';
import '../data_resources/fav_remote_data.dart';
import 'fav_repo.dart';

class FavRepoImpl implements FavRepo {
  final FavRemoteData _favRemoteData;
  final FavLocalData _favLocalData;

  FavRepoImpl(this._favRemoteData, this._favLocalData);

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
      log(error.toString());
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> addFav({
    required ProductModel product,
  }) async {
    try {
      await _favLocalData.addToFav(product.id);
      var response = await _favRemoteData.addToFav(product);
      return Right(response);
    } catch (error) {
      log(error.toString());
      return Left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> removeFav({
    required String productId,
  }) async {
    try {
      await _favLocalData.removeFromFav(productId);
      var response = await _favRemoteData.removeFromFav(productId);
      return Right(response);
    } catch (error) {
      return Left(ApiErrorHandler.handle(error));
    }
  }
}
