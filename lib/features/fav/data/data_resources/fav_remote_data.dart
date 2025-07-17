import 'package:hive/hive.dart';
import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/product_model.dart';

abstract class FavRemoteData {
  Future<List<ProductModel>> getFav();
  Future<String> addToFav(ProductModel product);
  Future<String> removeFromFav(String id);
}

class FavRemoteDataImpl implements FavRemoteData {
  final ApiService _apiService;

  FavRemoteDataImpl(this._apiService);
  @override
  Future<List<ProductModel>> getFav() async {
    var data = await _apiService.get(endPoint: ApiConstants.getFav);
    List<ProductModel> products =
        (data['list'] as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();

    final box = Hive.box<List<String>>(Constants.favBox);
    final productIds = products.map((product) => product.id).toList();
    await box.put(Constants.favBox, productIds);
    return products;
  }

  @override
  Future<String> addToFav(ProductModel product) async {
    var response = await _apiService.post(
      endPoint: ApiConstants.addFav,
      data: {'productId': product.id},
    );
    return response['message'];
  }

  @override
  Future<String> removeFromFav(String id) async {
    var response = await _apiService.post(
      endPoint: ApiConstants.removeFav,
      data: {'productId': id},
    );
    return response['message'];
  }
}
