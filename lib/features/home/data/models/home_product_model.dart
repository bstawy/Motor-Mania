import '../../domain/entities/home_product_entity.dart';
import 'home_car_model.dart';

class HomeProductModel extends HomeProductEntity {
  const HomeProductModel({
    required super.id,
    required super.name,
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

  factory HomeProductModel.fromJson(Map<String, dynamic> json) {
    return HomeProductModel(
      id: json['id'],
      name: json['name'],
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
