import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../data/models/product_model.dart';
import 'home_list_item_widget.dart';

class HomeListWidget extends StatelessWidget {
  final List<ProductModel> products;
  const HomeListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return HomeListItem(product: products[index])
              .setOnlyPadding(0, 0, 8.w, 0);
        },
      ),
    );
  }
}
