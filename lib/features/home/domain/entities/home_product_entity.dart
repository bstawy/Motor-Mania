import 'package:equatable/equatable.dart';

import 'car_entity.dart';

class HomeProductEntity extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final num? price;
  final num? oldPrice;
  final num? discountPercentage;
  final int? amount;
  final num? rating;
  final num? reviewsCount;
  final bool? newProduct;
  final bool? freeDelivery;
  final List<CarEntity>? compatibleCars;
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
    String? id,
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
      id: id ?? this.id,
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
        imageUrl,
        price,
        oldPrice,
        amount,
        rating,
        reviewsCount,
        newProduct,
        freeDelivery,
        compatibleCars,
        isFavorite,
      ];
}
