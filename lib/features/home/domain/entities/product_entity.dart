import 'category_entity.dart';

class ProductEntity {
  final int id;
  final String name;
  final String description;
  final String brandName;
  final String imageUrl;
  final double price;
  final int discountPercentage;
  final int amount;
  final double rating;
  final int reviewsCount;
  final bool newProduct;
  final bool freeDelivery;
  final String shippingInformation;
  final List<Sellers> sellers;
  final List<Category> categories;
  final List<CompatibleCars> compatibleCars;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.brandName,
    required this.imageUrl,
    required this.price,
    required this.discountPercentage,
    required this.amount,
    required this.rating,
    required this.reviewsCount,
    required this.newProduct,
    required this.freeDelivery,
    required this.shippingInformation,
    required this.sellers,
    required this.categories,
    required this.compatibleCars,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
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

class Sellers {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final double sellerRating;
  final int partnershipDuration;

  Sellers({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.sellerRating,
    required this.partnershipDuration,
  });

  factory Sellers.fromJson(Map<String, dynamic> json) {
    return Sellers(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      sellerRating: json['seller_rating'],
      partnershipDuration: json['partnership_duration'],
    );
  }
}

class CompatibleCars {
  final int id;
  final String brand;
  final String model;
  final int year;
  final String imageUrl;

  CompatibleCars({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.imageUrl,
  });

  factory CompatibleCars.fromJson(Map<String, dynamic> json) {
    return CompatibleCars(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      imageUrl: json['image_url'],
    );
  }
}
