import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../domain/entities/cart_product_entity.dart';
import 'cart_product_item_widget.dart';

class CartProductsListWidget extends StatelessWidget {
  final List<CartProductEntity> cartProducts;

  const CartProductsListWidget({
    super.key,
    required this.cartProducts,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CartProductItemWidget(cartProduct: cartProducts[index])
              .setOnlyPadding(0, 8.h, 0, 0);
        },
        childCount: cartProducts.length,
      ),
    );
  }
}
