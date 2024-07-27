import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/text/text_styles.dart';
import '../helpers/extensions/extensions.dart';
import 'products_list_item_widget.dart';

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
          height: 295.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductsListItemWidget(product: products[index])
                  .setOnlyPadding(0, 0, 8.w, 0);
            },
          ),
        ),
      ],
    );
  }
}
