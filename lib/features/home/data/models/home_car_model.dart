import '../../domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  const CarModel({
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
      model: (json['model']).toString(),
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
}
