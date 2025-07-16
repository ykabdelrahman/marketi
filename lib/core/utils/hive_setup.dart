import 'package:hive_flutter/hive_flutter.dart';
import 'package:marketi/core/utils/constants.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/cart/data/models/cart_model.dart';
import '../../features/home/data/models/brand_model.dart';
import '../../features/home/data/models/category_model.dart';
import '../../features/home/data/models/product_model.dart';

class HiveSetup {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(BrandModelAdapter());
    Hive.registerAdapter(CartModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<ProductModel>(Constants.productsBox);
    await Hive.openBox<CategoryModel>(Constants.categoriesBox);
    await Hive.openBox<BrandModel>(Constants.brandsBox);
    await Hive.openBox<CartModel>(Constants.cartBox);
    await Hive.openBox<ProductModel>(Constants.favBox);
    await Hive.openBox<UserModel>(Constants.userBox);
  }
}
