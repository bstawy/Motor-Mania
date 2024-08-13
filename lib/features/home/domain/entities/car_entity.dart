import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'car_entity.g.dart';

@HiveType(typeId: 3)
class CarEntity extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? brand;
  @HiveField(2)
  final String? model;
  @HiveField(3)
  final int? year;
  @HiveField(4)
  final String? imageUrl;
  @HiveField(5)
  final int? km;

  const CarEntity({
    this.id,
    this.brand,
    this.model,
    this.year,
    this.imageUrl,
    this.km = 80000,
  });

  CarEntity copyWith({
    String? brand,
    String? model,
    int? year,
    String? imageUrl,
    int? km,
  }) {
    return CarEntity(
      id: id,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      imageUrl: imageUrl ?? this.imageUrl,
      km: km ?? this.km,
    );
  }

  @override
  List<Object?> get props => [
        id,
        brand,
        model,
        year,
        imageUrl,
        km,
      ];
}
