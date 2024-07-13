import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.brandName,
    required super.imageUrl,
    required super.price,
    required super.discountPercentage,
    required super.amount,
    required super.rating,
    required super.reviewsCount,
    required super.newProduct,
    required super.freeDelivery,
    required super.shippingInformation,
    required super.sellers,
    required super.categories,
    required super.compatibleCars,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      brandName: json['brand_name'],
      imageUrl: json['image_url'],
      price: json['price'],
      discountPercentage: json['discount_percentage'],
      amount: json['amount'],
      rating: json['rating'],
      reviewsCount: json['reviews_count'],
      newProduct: json['new_product'],
      freeDelivery: json['free_delivery'],
      shippingInformation: json['shipping_information'],
      sellers: json['sellers'] != null
          ? (json['sellers'] as List).map((i) => Sellers.fromJson(i)).toList()
          : [],
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((i) => Category.fromJson(i))
              .toList()
          : [],
      compatibleCars: json['compatible_cars'] != null
          ? (json['compatible_cars'] as List)
              .map((i) => CompatibleCars.fromJson(i))
              .toList()
          : [],
    );
  }
}
