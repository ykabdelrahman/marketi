import 'package:hive/hive.dart';

import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/product_model.dart';

abstract class FavRemoteData {
  Future<List<ProductModel>> getFav();
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

    final box = Hive.box<ProductModel>(Constants.favBox);
    for (var product in products) {
      box.put(product.id, product);
    }
    return products;
  }
}
