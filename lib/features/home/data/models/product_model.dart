class ProductModel {
  final String name;
  final String carModel;
  final String description;
  final String imagePath;
  final double price;
  final double priceAfterDiscount;
  final double rating;
  final int reviewCount;
  final bool isNew;

  ProductModel({
    required this.name,
    required this.carModel,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.priceAfterDiscount,
    required this.rating,
    required this.reviewCount,
    this.isNew = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      carModel: json['carName'],
      description: json['description'],
      imagePath: json['imagePath'],
      price: json['price'],
      priceAfterDiscount: json['priceAfterDiscount'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
      isNew: json['isNew'],
    );
  }
}
