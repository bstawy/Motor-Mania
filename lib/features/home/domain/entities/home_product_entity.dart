import 'package:equatable/equatable.dart';

import 'car_entity.dart';

class HomeProductEntity extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final num? price;
  final num? oldPrice;
  final int? amount;
  final num? rating;
  final num? reviewsCount;
  final bool? newProduct;
  final bool? freeDelivery;
  final List<CarEntity>? compatibleCars;

  const HomeProductEntity({
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.oldPrice,
    this.amount,
    this.rating,
    this.reviewsCount,
    this.newProduct,
    this.freeDelivery,
    this.compatibleCars,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        price,
        oldPrice,
        amount,
        rating,
        reviewsCount,
        newProduct,
        freeDelivery,
        compatibleCars,
      ];
}
