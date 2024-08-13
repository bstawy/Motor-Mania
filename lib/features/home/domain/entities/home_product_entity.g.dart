// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeProductEntityAdapter extends TypeAdapter<HomeProductEntity> {
  @override
  final int typeId = 0;

  @override
  HomeProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeProductEntity(
      id: fields[0] as String?,
      name: fields[1] as String?,
      imageUrl: fields[2] as String?,
      price: fields[3] as num?,
      oldPrice: fields[4] as num?,
      discountPercentage: fields[5] as num?,
      amount: fields[6] as int?,
      rating: fields[7] as num?,
      reviewsCount: fields[8] as num?,
      newProduct: fields[9] as bool?,
      freeDelivery: fields[10] as bool?,
      compatibleCars: (fields[11] as List?)?.cast<CarEntity>(),
      isFavorite: fields[12] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeProductEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.oldPrice)
      ..writeByte(5)
      ..write(obj.discountPercentage)
      ..writeByte(6)
      ..write(obj.amount)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.reviewsCount)
      ..writeByte(9)
      ..write(obj.newProduct)
      ..writeByte(10)
      ..write(obj.freeDelivery)
      ..writeByte(11)
      ..write(obj.compatibleCars)
      ..writeByte(12)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
