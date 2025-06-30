import '../../../home/data/models/car_model.dart';
import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.oldPrice,
    super.price,
    required super.discountPercentage,
    required super.amount,
    required super.rating,
    required super.reviewsCount,
    required super.newProduct,
    required super.freeDelivery,
    required super.shippingInformation,
    required super.compatibleCars,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      oldPrice: json['oldPrice'],
      discountPercentage: json['discountPercentage'],
      amount: json['amount'],
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      newProduct: json['newProduct'],
      freeDelivery: json['freeDelivery'],
      shippingInformation: json['shippingInformation'],
      compatibleCars: json['compatibleCars'] != null
          ? (json['compatibleCars'] as List)
              .map((i) => CarModel.fromJson(i))
              .toList()
          : [],
    );
  }
}
