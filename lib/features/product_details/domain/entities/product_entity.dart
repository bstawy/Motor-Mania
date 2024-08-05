import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../home/domain/entities/car_entity.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 1)
class ProductEntity extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? imageUrl;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? oldPrice;
  @HiveField(6)
  final num? discountPercentage;
  @HiveField(7)
  final int? amount;
  @HiveField(8)
  final num? rating;
  @HiveField(9)
  final num? reviewsCount;
  @HiveField(10)
  final bool? newProduct;
  @HiveField(11)
  final bool? freeDelivery;
  @HiveField(12)
  final String? shippingInformation;
  @HiveField(13)
  final List<CarEntity>? compatibleCars;
  @HiveField(14)
  final bool? isFavorite;

  const ProductEntity({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.oldPrice,
    this.discountPercentage,
    this.amount,
    this.rating,
    this.reviewsCount,
    this.newProduct,
    this.freeDelivery,
    this.shippingInformation,
    this.compatibleCars,
    this.isFavorite,
  });

  ProductEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    num? price,
    num? oldPrice,
    num? discountPercentage,
    int? amount,
    num? rating,
    num? reviewsCount,
    bool? newProduct,
    bool? freeDelivery,
    String? shippingInformation,
    List<CarEntity>? compatibleCars,
    bool? isFavorite,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      amount: amount ?? this.amount,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      newProduct: newProduct ?? this.newProduct,
      freeDelivery: freeDelivery ?? this.freeDelivery,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      compatibleCars: compatibleCars ?? this.compatibleCars,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        price,
        oldPrice,
        amount,
        rating,
        reviewsCount,
        newProduct,
        freeDelivery,
        shippingInformation,
        compatibleCars,
        isFavorite,
      ];
}
