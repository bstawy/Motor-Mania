import '../../domain/entities/car_brand_model_entity.dart';

class CarBrandModelModel extends CarBrandModelEntity {
  const CarBrandModelModel({
    required super.id,
    required super.name,
    required super.year,
  });

  factory CarBrandModelModel.fromJson(Map<String, dynamic> json) {
    return CarBrandModelModel(
      id: json['id'],
      name: json['name'].toString(),
      year: json['year'],
    );
  }
}
