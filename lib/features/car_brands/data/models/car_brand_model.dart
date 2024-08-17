import '../../domain/entities/car_brand_entity.dart';

class CarBrandModel extends CarBrandEntity {
  const CarBrandModel({
    required super.id,
    required super.name,
    required super.logoUrl,
  });

  factory CarBrandModel.fromJson(Map<String, dynamic> json) {
    return CarBrandModel(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logo_url'],
    );
  }
}
