import '../../domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  CarModel({
    required super.id,
    required super.brand,
    required super.model,
    required super.year,
    required super.imageUrl,
    super.km,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      imageUrl: json['image_url'],
      km: json['km'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'year': year,
      'image_url': imageUrl,
      'km': km,
    };
  }
}
