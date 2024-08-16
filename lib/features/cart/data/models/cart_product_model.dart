import '../../../product_details/data/models/product_model.dart';
import '../../domain/entities/cart_product_entity.dart';

class CartProductModel extends CartProductEntity {
  const CartProductModel({
    required super.quantity,
    required super.product,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      quantity: json['quantity'],
      product: ProductModel.fromJson(json['product']),
    );
  }
}
