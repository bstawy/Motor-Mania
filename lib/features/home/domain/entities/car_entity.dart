class CarEntity {
  final int id;
  final String brand;
  final String model;
  final int year;
  final String imageUrl;
  final int? km;

  CarEntity({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.imageUrl,
    required this.km,
  });

  factory CarEntity.formJson(Map<String, dynamic> json) {
    return CarEntity(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      imageUrl: json['image_url'],
      km: json['km'],
    );
  }

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
