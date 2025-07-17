import 'package:hive/hive.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/home/data/models/brand_model.dart';
import '../../features/home/data/models/category_model.dart';
import '../../features/home/data/models/product_model.dart';
import '../data/cache_helper.dart';
import 'constants.dart';

Future<void> clearCache() async {
  await CacheHelper.deleteAllSecureData();
  final boxes = [
    Hive.box<BrandModel>(Constants.brandsBox),
    Hive.box<CategoryModel>(Constants.categoriesBox),
    Hive.box<ProductModel>(Constants.productsBox),
    Hive.box<List<String>>(Constants.favBox),
    Hive.box<ProductModel>(Constants.cartBox),
    Hive.box<UserModel>(Constants.userBox),
  ];
  for (var box in boxes) {
    await box.clear();
  }
}
