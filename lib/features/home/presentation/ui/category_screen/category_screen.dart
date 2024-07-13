import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'widgets/category_product_item_widget.dart';

import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/search_bar_widget.dart';
import '../../../domain/entities/category_entity.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Category category;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = ModalRoute.of(context)!.settings.arguments as Category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      body: Column(
        children: [
          const SearchBarWidget(
            hintText: "What are you looking for?",
            borderColor: ColorsManager.lighterBlue,
          ),
          Gap(8.h),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final subCategory = category.subCategories[index];
                return CategoryProductItemWidget(product: products[index])
              },
            ),
          ),
        ],
      ),
    );
  }
}
