import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'car_entity.dart';

part 'home_product_entity.g.dart';

@HiveType(typeId: 0)
class HomeProductEntity extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? imageUrl;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final num? oldPrice;
  @HiveField(5)
  final num? discountPercentage;
  @HiveField(6)
  final int? amount;
  @HiveField(7)
  final num? rating;
  @HiveField(8)
  final num? reviewsCount;
  @HiveField(9)
  final bool? newProduct;
  @HiveField(10)
  final bool? freeDelivery;
  @HiveField(11)
  final List<CarEntity>? compatibleCars;
  @HiveField(12)
  final bool? isFavorite;

  const HomeProductEntity({
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.oldPrice,
    this.discountPercentage,
    this.amount,
    this.rating,
    this.reviewsCount,
    this.newProduct,
    this.freeDelivery,
    this.compatibleCars,
    this.isFavorite = false,
  });

  HomeProductEntity copyWith({
    String? name,
    String? imageUrl,
    num? price,
    num? oldPrice,
    num? discountPercentage,
    int? amount,
    num? rating,
    num? reviewsCount,
    bool? newProduct,
    bool? freeDelivery,
    List<CarEntity>? compatibleCars,
    bool? isFavorite,
  }) {
    return HomeProductEntity(
      id: id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      amount: amount ?? this.amount,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      newProduct: newProduct ?? this.newProduct,
      freeDelivery: freeDelivery ?? this.freeDelivery,
      compatibleCars: compatibleCars ?? this.compatibleCars,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        // imageUrl,
        // price,
        // oldPrice,
        // amount,
        // rating,
        // reviewsCount,
        // newProduct,
        // freeDelivery,
        // compatibleCars,
        // isFavorite,
      ];
}
