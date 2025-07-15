class BrandModel {
  final String id;
  final String name;
  final String imagePath;

  BrandModel({required this.id, required this.name, required this.imagePath});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'imagePath': imagePath};
  }
}

BrandModel dummyBrand() => BrandModel(
  id: '',
  name: 'Dummy Brand',
  imagePath:
      'https://i.pinimg.com/736x/69/44/6a/69446a0a5a3b3e4dc630875a0d6b1935.jpg',
);
