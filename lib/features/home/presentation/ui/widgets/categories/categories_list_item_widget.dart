import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../category/presentation/logic/category_cubit.dart';
import '../../../../../category/presentation/ui/category_screen.dart';
import '../../../../domain/entities/category_entity.dart';

class CategoriesListItem extends StatelessWidget {
  final HomeCategoryEntity category;

  const CategoriesListItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: BlocProvider<CategoryCubit>(
            create: (context) => getIt<CategoryCubit>(),
            child: CategoryScreen(category: category),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 8.w),
        width: 71.w,
        decoration: BoxDecoration(
          color: customColors.inversePrimary,
          borderRadius: BorderRadius.circular(17.r),
        ),
        child: Column(
          children: [
            SvgPicture.network(
              category.imageUrl,
              width: 27.w,
              height: 27.h,

              // TODO: get dark icons and delete color filter
              colorFilter: ColorFilter.mode(
                customColors.primary,
                BlendMode.srcIn,
              ),
            ),
            Gap(2.h),
            Text(
              category.name,
              style: customTextStyles.headlineSmall?.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
