class ProductModel {
  final String id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final double rating;
  final int? discount;
  final int? remain;
  final int? sold;
  final String category;
  final String brand;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
    required this.createdAt,
    required this.updatedAt,
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
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

ProductModel dummyProduct() => ProductModel(
  id: '',
  title: '',
  price: 0,
  description: '',
  images: [
    'https://i.pinimg.com/736x/69/44/6a/69446a0a5a3b3e4dc630875a0d6b1935.jpg',
    '',
  ],
  rating: 0.0,
  discount: 0,
  remain: 0,
  sold: 0,
  category: '',
  brand: '',
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);
