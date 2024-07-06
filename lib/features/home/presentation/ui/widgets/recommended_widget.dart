import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../data/models/product_model.dart';
import 'home_list_widget.dart';

class RecommendedWidget extends StatelessWidget {
  RecommendedWidget({super.key});

  final List<ProductModel> _products = [
    ProductModel(
      name: "Brembo 5520",
      carModel: "i8 Brake Caliper",
      description: "",
      price: 33.98,
      priceAfterDiscount: 26.98,
      rating: 4.8,
      reviewCount: 856,
      imagePath: "assets/images/disk_2_image.png",
    ),
    ProductModel(
      name: "ACDelco 630",
      carModel: "i8 Brake Caliper",
      description: "",
      price: 23.98,
      priceAfterDiscount: 19.98,
      rating: 4.2,
      reviewCount: 562,
      imagePath: "assets/images/injector_image.png",
      isNew: true,
    ),
    ProductModel(
      name: "Bosch 3330",
      carModel: "i8 Brake Caliper",
      description: "",
      price: 23.98,
      priceAfterDiscount: 12.98,
      rating: 4.8,
      reviewCount: 856,
      imagePath: "assets/images/filter_image.png",
    ),
    ProductModel(
      name: "Braking Sys.",
      carModel: "i8 Brake Caliper",
      description: "",
      price: 30.98,
      priceAfterDiscount: 26.98,
      rating: 4.2,
      reviewCount: 562,
      imagePath: "assets/images/disk_image.png",
      isNew: true,
    ),
    ProductModel(
      name: "Continental Tyre",
      carModel: "i8 Brake Caliper",
      description: "",
      price: 109.98,
      priceAfterDiscount: 97.98,
      rating: 4.2,
      reviewCount: 562,
      imagePath: "assets/images/tire_image.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended For You",
          style: TextStyles.font14DarkBlueSemiBold,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        HomeListWidget(products: _products),
      ],
    );
  }
}
