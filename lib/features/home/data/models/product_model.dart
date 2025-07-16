import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final List<String> images;
  @HiveField(5)
  final double rating;
  @HiveField(6)
  final int? discount;
  @HiveField(7)
  final int? remain;
  @HiveField(8)
  final int? sold;
  @HiveField(9)
  final String category;
  @HiveField(10)
  final String brand;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.rating,
    required this.discount,
    required this.remain,
    required this.sold,
    required this.category,
    required this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: List<String>.from(json['images']),
      rating: (json['rating'] as num).toDouble(),
      discount: json['discount'],
      remain: json['remain'],
      sold: json['sold'],
      category: json['category'],
      brand: json['brand'],
    );
  }
}

ProductModel dummyProduct() => ProductModel(
  id: '',
  title: 'Dummy Product',
  price: 1234,
  description: 'This is a dummy product description.',
  images: [
    'https://i.pinimg.com/736x/69/44/6a/69446a0a5a3b3e4dc630875a0d6b1935.jpg',
    '',
  ],
  rating: 0.0,
  discount: 0,
  remain: 0,
  sold: 0,
  category: 'Dummy Category',
  brand: 'Dummy Brand',
);
