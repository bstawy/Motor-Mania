import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor_mania/core/widgets/product_item_widget.dart';

class ProductsGridWidget extends StatelessWidget {
  final List<dynamic> products;

  const ProductsGridWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        mainAxisExtent: 285.h,
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItemWidget(
          product: products[index],
          cardWidth: 167.w,
          imageHeight: 95.h,
          showDiscount: true,
        );
      },
    );
  }
}
