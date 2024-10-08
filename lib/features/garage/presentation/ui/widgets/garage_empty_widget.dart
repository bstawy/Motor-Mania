import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/widgets/empty_screen_widget.dart';
import '../../logic/garage_cubit.dart';

class GarageEmptyWidget extends StatelessWidget {
  const GarageEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GarageCubit>().getGarageCars();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            EmptyScreenWidget(
              imagePath: AssetsManager.garageEmptyImage,
              darkImagePath: AssetsManager.garageEmptyDarkImage,
              imageWidth: 300.w,
              imageHeight: 285.h,
              secondTextSpan: "Oops!!\n",
              thirdTextSpan: "Your Garage Is Empty",
              description:
                  "Add your cars to \"My Garage\" for a personalized experience and quick access to the parts you need.",
              // firstTextStyle: TextStyles.font24RedSemiBold,
              // secondTextStyle: TextStyles.font24DarkBlueSemiBold,
              leftPadding: 24.w,
              rightPadding: 24.w,
            ),
            //const Spacer(),
            Gap(60.h),
            CustomMaterialButton(
              onClicked: () {
                context.pushNamed(Routes.cars);
              },
              title: "Add New Car",
            ),
          ],
        ).setHorizontalAndVerticalPadding(16.w, 16.h),
      ),
    );
  }
}
