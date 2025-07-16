import 'package:hive/hive.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/product_model.dart';

abstract class FavLocalData {
  List<ProductModel> getFav();
  Future<void> clearCache();
}

class FavLocalDataImpl implements FavLocalData {
  @override
  List<ProductModel> getFav() {
    final box = Hive.box<ProductModel>(Constants.favBox);
    return box.values.toList();
  }

  @override
  Future<void> clearCache() async {
    final box = Hive.box<ProductModel>(Constants.favBox);
    await box.clear();
  }
}
