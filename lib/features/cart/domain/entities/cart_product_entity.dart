import 'package:equatable/equatable.dart';

import '../../../product_details/domain/entities/product_entity.dart';

class CartProductEntity extends Equatable {
  final int quantity;
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
