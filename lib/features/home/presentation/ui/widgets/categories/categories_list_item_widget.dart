import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../../../../core/config/text/text_styles.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../category/presentation/logic/category_cubit.dart';
import '../../../../../category/presentation/ui/category_screen.dart';
import '../../../../domain/entities/category_entity.dart';

class CategoriesListItem extends StatelessWidget {
  final HomeCategoryEntity category;

  const CategoriesListItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushScreen(
          context,
          screen: BlocProvider<CategoryCubit>(
            create: (context) => getIt<CategoryCubit>(),
            child: CategoryScreen(category: category),
          ),
          withNavBar: true,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 8.w),
        width: 71.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17.r),
        ),
        child: Column(
          children: [
            SvgPicture.network(
              category.imageUrl,
              width: 27.w,
              height: 27.h,
            ),
            Gap(2.h),
            Text(
              category.name,
              style: TextStyles.font12DarkBlueMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
