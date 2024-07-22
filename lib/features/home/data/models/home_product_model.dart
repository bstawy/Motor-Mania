import '../../domain/entities/home_product_entity.dart';
import 'home_car_model.dart';

class HomeProductModel extends HomeProductEntity {
  const HomeProductModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    super.price,
    required super.discountPercentage,
    required super.amount,
    required super.rating,
    required super.reviewsCount,
    required super.newProduct,
    required super.freeDelivery,
    required super.compatibleCars,
    required super.oldPrice,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) {
    return HomeProductModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      oldPrice: json['price'],
      discountPercentage: json['discount_percentage'],
      amount: json['amount'],
      rating: json['rating'],
      reviewsCount: json['reviews_count'],
      newProduct: json['new_product'],
      freeDelivery: json['free_delivery'],
      compatibleCars: json['compatible_cars'] != null
          ? (json['compatible_cars'] as List)
              .map((i) => CarModel.fromJson(i))
              .toList()
          : [],
    );
  }
}
