import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../logic/home_cubit.dart';
import 'categories_list_item_widget.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>()..getAllCategories(),
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return _buildCategoriesLoading();
        } else if (state is CategoriesLoaded) {
          return _buildCategoriesLoaded(state);
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
      height: 65.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: Container(
              height: 60.h,
              width: 60.w,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ).setOnlyPadding(0, 0, 8.w, 0),
          );
        },
      ),
    );
  }

  Widget _buildCategoriesLoaded(CategoriesLoaded state) {
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: state.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // TODO: navigate to category screen
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "${state.categories[index].name} tapped!",
                  ),
                ),
              );
            },
            child: CategoriesListItem(
              category: state.categories[index],
            ).setOnlyPadding(0, 0, 8.w, 0),
          );
        },
      ),
    );
  }
}
