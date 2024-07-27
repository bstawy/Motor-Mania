import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'products_grid_item_widget.dart';

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
        childAspectRatio: 0.52.r,
      ),
      padding: EdgeInsets.only(top: 16.h),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductsGridItemWidget(product: products[index]);
      },
    );
  }
}
