import '../../domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  CarModel({
    required super.id,
    required super.brand,
    required super.model,
    required super.year,
    required super.imageUrl,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'year': year,
      'image_url': imageUrl,
    };
  }

  CarEntity toEntity(int km) {
    return CarEntity(
      id: id,
      brand: brand,
      model: model,
      year: year,
      imageUrl: imageUrl,
      km: km,
    );
  }
}
