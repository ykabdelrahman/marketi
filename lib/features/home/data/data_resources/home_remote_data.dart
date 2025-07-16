import 'package:hive/hive.dart';
import '../../../../core/data/api_constants.dart';
import '../../../../core/data/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../models/brand_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class HomeRemoteData {
  Future<List<BrandModel>> getBrands();
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts();
}

class HomeRemoteDataImpl implements HomeRemoteData {
  final ApiService _apiService;
  HomeRemoteDataImpl(this._apiService);
  @override
  Future<List<BrandModel>> getBrands() async {
    var data = await _apiService.get(endPoint: ApiConstants.brands);
    List<BrandModel> brands =
        (data['list'] as List)
            .map((item) => BrandModel.fromJson(item))
            .toList();

    final box = Hive.box<BrandModel>(Constants.brandsBox);
    for (var brand in brands) {
      box.put(brand.id, brand);
    }
    return brands;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    var data = await _apiService.get(endPoint: ApiConstants.categories);
    List<CategoryModel> categories =
        (data['list'] as List)
            .map((item) => CategoryModel.fromJson(item))
            .toList();

    final box = Hive.box<CategoryModel>(Constants.categoriesBox);
    for (var category in categories) {
      box.put(category.id, category);
    }
    return categories;
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    var data = await _apiService.get(endPoint: ApiConstants.products);
    List<ProductModel> products =
        (data['list'] as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();

    final box = Hive.box<ProductModel>(Constants.productsBox);
    for (var product in products) {
      box.put(product.id, product);
    }
    return products;
  }
}
