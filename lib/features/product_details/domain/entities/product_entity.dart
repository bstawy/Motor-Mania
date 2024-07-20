import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/car_entity.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final num? price;
  final num? oldPrice;
  final num? discountPercentage;
  final int? amount;
  final num? rating;
  final num? reviewsCount;
  final bool? newProduct;
  final bool? freeDelivery;
  final String? shippingInformation;
  final List<CarEntity>? compatibleCars;

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
      ];
}
