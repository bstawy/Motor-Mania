class AddCarModel {
  final String brand;
  final String model;
  final int year;

  AddCarModel({
    required this.brand,
    required this.model,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'year': year,
    };
  }
}
