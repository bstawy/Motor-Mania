import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../product_details/domain/entities/product_entity.dart';

part 'cart_product_entity.g.dart';

@HiveType(typeId: 2)
class CartProductEntity extends Equatable {
  @HiveField(0)
  final int quantity;
  @HiveField(1)
  final ProductEntity product;

  const CartProductEntity({
    required this.quantity,
    required this.product,
  });

  CartProductEntity copyWith({
    int? quantity,
    ProductEntity? product,
  }) {
    return CartProductEntity(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [quantity, product];
}
