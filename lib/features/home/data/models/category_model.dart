import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imagePath;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'imagePath': imagePath};
  }
}

CategoryModel dummyCategory() => CategoryModel(
  id: '',
  name: 'Category',
  imagePath:
      'https://i.pinimg.com/736x/69/44/6a/69446a0a5a3b3e4dc630875a0d6b1935.jpg',
);
