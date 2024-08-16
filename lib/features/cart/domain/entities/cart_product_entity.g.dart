// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductEntityAdapter extends TypeAdapter<CartProductEntity> {
  @override
  final int typeId = 2;

  @override
  CartProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductEntity(
      quantity: fields[0] as int,
      product: fields[1] as ProductEntity,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.quantity)
      ..writeByte(1)
      ..write(obj.product);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
