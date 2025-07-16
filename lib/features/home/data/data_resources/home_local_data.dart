import 'package:hive/hive.dart';
import 'package:marketi/core/utils/constants.dart';
import '../models/brand_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class HomeLocalData {
  List<ProductModel> getProducts();
  List<CategoryModel> getCategories();
  List<BrandModel> getBrands();
}

class HomeLocalDataImpl implements HomeLocalData {
  @override
  List<BrandModel> getBrands() {
    final box = Hive.box<BrandModel>(Constants.brandsBox);
    return box.values.toList();
  }

  @override
  List<CategoryModel> getCategories() {
    final box = Hive.box<CategoryModel>(Constants.categoriesBox);
    return box.values.toList();
  }

  @override
  List<ProductModel> getProducts() {
    final box = Hive.box<ProductModel>(Constants.productsBox);
    return box.values.toList();
  }
}
