// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarEntityAdapter extends TypeAdapter<CarEntity> {
  @override
  final int typeId = 3;

  @override
  CarEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarEntity(
      id: fields[0] as int?,
      brand: fields[1] as String?,
      model: fields[2] as String?,
      year: fields[3] as int?,
      imageUrl: fields[4] as String?,
      km: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CarEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.km);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
