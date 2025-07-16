import 'package:hive/hive.dart';
import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../models/cart_model.dart';

abstract class CartRemoteData {
  Future<List<CartModel>> getCart();
}

class CartRemoteDataImpl implements CartRemoteData {
  final ApiService _apiService;

  CartRemoteDataImpl(this._apiService);
  @override
  Future<List<CartModel>> getCart() async {
    var data = await _apiService.get(endPoint: ApiConstants.getCart);
    List<CartModel> products =
        (data['list'] as List).map((item) => CartModel.fromJson(item)).toList();

    final box = Hive.box<CartModel>(Constants.cartBox);
    for (var product in products) {
      box.put(product.id, product);
    }
    return products;
  }
}
