import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  final int? id;
  final String? brand;
  final String? model;
  final int? year;
  final String? imageUrl;
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
