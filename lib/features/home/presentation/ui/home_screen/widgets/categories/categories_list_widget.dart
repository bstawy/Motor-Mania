import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../domain/entities/category_entity.dart';
import '../../../../logic/home_cubit.dart';
import 'categories_list_item_widget.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>()..getAllCategories(),
      buildWhen: (previous, current) {
        if (current is CategoriesLoading ||
            current is CategoriesLoaded ||
            current is CategoriesError) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return _buildCategoriesLoading();
        } else if (state is CategoriesLoaded) {
          return _buildCategoriesLoaded(state.categories);
        } else if (state is CategoriesError) {
          return Center(
            child: Text(state.message).setHorizontalPadding(16.w),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildCategoriesLoading() {
    return SizedBox(
      height: 75.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: Container(
              height: 74.h,
              width: 71.w,
              padding: EdgeInsets.all(13.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17.r),
              ),
            ).setOnlyPadding(0, 0, 8.w, 0),
          );
        },
      ),
    );
  }

  Widget _buildCategoriesLoaded(List<Category> categories) {
    return SizedBox(
      height: 75.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // TODO: navigate to category screen
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "${categories[index].name} tapped!",
                  ),
                ),
              );
            },
            child: CategoriesListItem(
              category: categories[index],
            ).setOnlyPadding(0, 0, 8.w, 0),
          );
        },
      ),
    );
  }
}
