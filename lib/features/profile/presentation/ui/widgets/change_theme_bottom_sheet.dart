import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../layout/logic/layout_cubit.dart';

class ChangeThemeBottomSheet extends StatelessWidget {
  const ChangeThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3.h,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            Container(
              height: 5.h,
              margin: EdgeInsets.symmetric(horizontal: 0.4.sw),
              decoration: BoxDecoration(
                color: ColorsManager.blueGrey,
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
            Gap(16.h),
            Text(
              "Choose color theme",
              textAlign: TextAlign.center,
              style: TextStyles.font16DarkBlueBold,
            ),
            Gap(32.h),
            CustomMaterialButton(
              onClicked: () {
                // TODO: close bottom sheet after finishing the action
                context.read<AppManagerCubit>().changeTheme(ThemeMode.light);
                context.read<LayoutCubit>().changeTab(0);
              },
              title: "Light Mode",
              titleStyle: TextStyles.font14WhiteSemiBold,
              backgroundColor: ColorsManager.darkBlue,
            ),
            Gap(8.h),
            CustomMaterialButton(
              onClicked: () {
                context.read<AppManagerCubit>().changeTheme(ThemeMode.dark);
                context.read<LayoutCubit>().changeTab(0);
              },
              title: "Dark Mode",
              titleStyle: TextStyles.font14RedSemiBold,
              backgroundColor: Colors.white,
              borderColor: ColorsManager.red,
            ),
          ],
        ).setOnlyPadding(16.h, 0, 16.w, 16.w);
      },
    );
  }
}
