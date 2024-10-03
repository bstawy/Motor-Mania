import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class CarAddedSuccessSheet extends StatelessWidget {
  const CarAddedSuccessSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65.h,
      expand: false,
      builder: (context, scrollController) {
        return SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 175.h,
                child: Image.asset("assets/images/success_image.png"),
              ),
              Gap(12.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Success!\n",
                  style: TextStyles.font24RedSemiBold,
                  children: [
                    TextSpan(
                      text: "car has been added to Your Garage.",
                      style: TextStyles.font24DarkBlueSemiBold,
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Text(
                "You can now easily find compatible parts and accessories for your vehicle. Happy shopping!",
                textAlign: TextAlign.center,
                style: TextStyles.font12BlueGreyRegular,
              ).setHorizontalPadding(30.w),
              Gap(24.h),
              CustomMaterialButton(
                onClicked: () {
                  context.popUntil(
                    Routes.layoutScreen,
                  );
                },
                title: "Go To Home",
                titleStyle: TextStyles.font14WhiteSemiBold,
                height: 45.h,
              ),
              Gap(8.h),
              CustomMaterialButton(
                onClicked: () {
                  context.pop();
                },
                title: "Add New Car",
                titleStyle: TextStyles.font14RedSemiBold,
                height: 45.h,
                backgroundColor: Colors.white,
                borderColor: ColorsManager.red,
              )
            ],
          ).setOnlyPadding(32.h, 0, 16.w, 16.w),
        );
      },
    );
  }
}
