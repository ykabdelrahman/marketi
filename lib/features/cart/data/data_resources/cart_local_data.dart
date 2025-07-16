import 'package:hive/hive.dart';
import '../../../../core/utils/constants.dart';
import '../models/cart_model.dart';

abstract class CartLocalData {
  List<CartModel> getCart();
  Future<void> clearCache();
}

class CartLocalDataImpl extends CartLocalData {
  @override
  List<CartModel> getCart() {
    final box = Hive.box<CartModel>(Constants.cartBox);
    return box.values.toList();
  }

  @override
  Future<void> clearCache() async {
    final box = Hive.box<CartModel>(Constants.cartBox);
    await box.clear();
  }
}
