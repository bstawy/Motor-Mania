import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/font_weight_helper.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../home/presentation/logic/home_cubit/home_cubit.dart';
import '../../../../home/presentation/ui/widgets/home_list_widget.dart';

class FavoritesEmptyWidget extends StatelessWidget {
  const FavoritesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Gap(48.h),
          SizedBox(
            width: 300.w,
            height: 240.h,
            child: Image.asset("assets/images/favorites_empty_image.png"),
          ),
          Gap(24.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Ready To Make A ',
                  style: TextStyles.font24DarkBlueBold
                      .copyWith(fontWeight: FontWeightHelper.semiBold),
                  children: [
                    TextSpan(
                      text: 'Wish?',
                      style: TextStyles.font24DarkBlueBold.copyWith(
                        fontWeight: FontWeightHelper.semiBold,
                        color: ColorsManager.red,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(8.h),
              Text(
                'Start adding items you love to your Favorites by tapping on the heart icon',
                style: TextStyles.font12DarkBlueRegular.copyWith(
                  color: ColorsManager.lightGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ).setHorizontalPadding(60.w),
          Gap(32.h),
          BlocProvider<HomeCubit>(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeListWidget(title: "Recommended For You"),
          ),
        ],
      ),
    );
  }
}
