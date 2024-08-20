// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductEntityAdapter extends TypeAdapter<ProductEntity> {
  @override
  final int typeId = 1;

  @override
  ProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductEntity(
      id: fields[0] as int?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      imageUrl: fields[3] as String?,
      price: fields[4] as num?,
      oldPrice: fields[5] as num?,
      discountPercentage: fields[6] as num?,
      amount: fields[7] as int?,
      rating: fields[8] as num?,
      reviewsCount: fields[9] as num?,
      newProduct: fields[10] as bool?,
      freeDelivery: fields[11] as bool?,
      shippingInformation: fields[12] as String?,
      compatibleCars: (fields[13] as List?)?.cast<CarEntity>(),
      isFavorite: fields[14] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductEntity obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.oldPrice)
      ..writeByte(6)
      ..write(obj.discountPercentage)
      ..writeByte(7)
      ..write(obj.amount)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.reviewsCount)
      ..writeByte(10)
      ..write(obj.newProduct)
      ..writeByte(11)
      ..write(obj.freeDelivery)
      ..writeByte(12)
      ..write(obj.shippingInformation)
      ..writeByte(13)
      ..write(obj.compatibleCars)
      ..writeByte(14)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
