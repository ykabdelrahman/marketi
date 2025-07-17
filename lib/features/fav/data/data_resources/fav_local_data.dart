import 'package:hive/hive.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/product_model.dart';

abstract class FavLocalData {
  List<ProductModel> getFav();
  Future<void> addToFav(String id);
  Future<void> removeFromFav(String id);
}

class FavLocalDataImpl implements FavLocalData {
  @override
  List<ProductModel> getFav() {
    final box = Hive.box<List<String>>(Constants.favBox);
    final favIds =
        box.get(Constants.favBox, defaultValue: <String>[])!.cast<String>();
    final productsBox = Hive.box<ProductModel>(Constants.productsBox);
    return favIds
        .map((id) => productsBox.get(id))
        .whereType<ProductModel>()
        .toList();
  }

  @override
  Future<void> addToFav(String id) async {
    final box = Hive.box<List<String>>(Constants.favBox);
    final favIds =
        box.get(Constants.favBox, defaultValue: <String>[])!.cast<String>();
    favIds.add(id);
    await box.put(Constants.favBox, favIds);
  }

  @override
  Future<void> removeFromFav(String id) async {
    final box = Hive.box<List<String>>(Constants.favBox);
    final favIds =
        box.get(Constants.favBox, defaultValue: <String>[])!.cast<String>();
    favIds.remove(id);
    await box.put(Constants.favBox, favIds);
  }
}
