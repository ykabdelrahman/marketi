class CategoryModel {
  final String id;
  final String name;
  final String imagePath;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'imagePath': imagePath};
  }
}

CategoryModel dummyCategory() => CategoryModel(
  id: '',
  name: '',
  imagePath:
      'https://i.pinimg.com/736x/69/44/6a/69446a0a5a3b3e4dc630875a0d6b1935.jpg',
);
