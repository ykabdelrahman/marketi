import 'package:hive/hive.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/product_model.dart';

abstract class CartLocalData {
  List<ProductModel> getCart();
  Future<void> addToCart(ProductModel product);
  Future<void> removeFromCart(String id);
}

class CartLocalDataImpl extends CartLocalData {
  @override
  List<ProductModel> getCart() {
    final box = Hive.box<ProductModel>(Constants.cartBox);
    return box.values.toList();
  }

  @override
  Future<void> addToCart(ProductModel product) async {
    final box = Hive.box<ProductModel>(Constants.cartBox);
    await box.put(product.id, product);
  }

  @override
  Future<void> removeFromCart(String id) async {
    final box = Hive.box<ProductModel>(Constants.cartBox);
    await box.delete(id);
  }
}
