import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/text/text_styles.dart';
import '../helpers/extensions/extensions.dart';
import 'product_item_widget.dart';

class ProductsListWidget extends StatelessWidget {
  final String title;
  final List<dynamic> products;

  const ProductsListWidget({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font14DarkBlueSemiBold,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 300.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
            itemCount: products.length.clamp(0, 10),
            separatorBuilder: (context, index) => Gap(8.w),
            itemBuilder: (context, index) {
              return ProductItemWidget(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}
