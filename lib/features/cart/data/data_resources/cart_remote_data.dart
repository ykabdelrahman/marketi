import 'package:hive/hive.dart';
import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/product_model.dart';

abstract class CartRemoteData {
  Future<List<ProductModel>> getCart();
  Future<String> addToCart(ProductModel product);
  Future<String> removeFromCart(String id);
}

class CartRemoteDataImpl implements CartRemoteData {
  final ApiService _apiService;

  CartRemoteDataImpl(this._apiService);
  @override
  Future<List<ProductModel>> getCart() async {
    var data = await _apiService.get(endPoint: ApiConstants.getCart);
    List<ProductModel> products =
        (data['list'] as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();

    final box = Hive.box<ProductModel>(Constants.cartBox);
    for (var product in products) {
      box.put(product.id, product);
    }
    return products;
  }

  @override
  Future<String> addToCart(ProductModel product) async {
    var response = await _apiService.post(
      endPoint: ApiConstants.addCart,
      data: {'productId': product.id},
    );
    return response['message'];
  }

  @override
  Future<String> removeFromCart(String id) async {
    var response = await _apiService.delete(
      endPoint: ApiConstants.removeCart,
      data: {'productId': id},
    );
    return response['message'];
  }
}
