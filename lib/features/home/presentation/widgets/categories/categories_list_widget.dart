import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import 'categories_list_item_widget.dart';
import 'category_item_model.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});

  final List<CategoryItemModel> _categories = [
    CategoryItemModel(
      title: "Engine",
      imageUrl: "assets/icons/category_engine_icon.svg",
    ),
    CategoryItemModel(
      title: "Brakes",
      imageUrl: "assets/icons/category_brakes_icon.svg",
    ),
    CategoryItemModel(
      title: "Exterior",
      imageUrl: "assets/icons/category_exterior_icon.svg",
    ),
    CategoryItemModel(
      title: "Electric",
      imageUrl: "assets/icons/category_electric_icon.svg",
    ),
    CategoryItemModel(
      title: "Tyres",
      imageUrl: "assets/icons/category_tyres_icon.svg",
    ),
    CategoryItemModel(
      title: "Suspension",
      imageUrl: "assets/icons/category_suspension_icon.svg",
    ),
    CategoryItemModel(
      title: "Interior",
      imageUrl: "assets/icons/category_interior_icon.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // TODO: navigate to category screen
            },
            child: CategoriesListItem(
              category: _categories[index],
            ).setOnlyPadding(0, 0, 8.w, 0),
          );
        },
      ),
    );
  }
}
