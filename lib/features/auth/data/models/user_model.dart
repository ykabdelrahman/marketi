import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 4)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String gender;

  @HiveField(5)
  final String address;

  @HiveField(6)
  final String type;

  @HiveField(7)
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.gender,
    required this.address,
    required this.type,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['message'];
    return UserModel(
      id: data['_id'],
      name: data['name'],
      phone: data['phone'],
      email: data['email'],
      gender: data['gender'],
      address: data['address'],
      type: data['type'],
      image: data['image'],
    );
  }
}
