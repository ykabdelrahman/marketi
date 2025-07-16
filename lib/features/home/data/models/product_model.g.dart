// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as String,
      title: fields[1] as String,
      price: fields[2] as int,
      description: fields[3] as String,
      images: (fields[4] as List).cast<String>(),
      rating: fields[5] as double,
      discount: fields[6] as int?,
      remain: fields[7] as int?,
      sold: fields[8] as int?,
      category: fields[9] as String,
      brand: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.images)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.discount)
      ..writeByte(7)
      ..write(obj.remain)
      ..writeByte(8)
      ..write(obj.sold)
      ..writeByte(9)
      ..write(obj.category)
      ..writeByte(10)
      ..write(obj.brand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
