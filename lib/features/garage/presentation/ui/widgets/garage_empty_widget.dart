import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/widgets/empty_screen_widget.dart';

class GarageEmptyWidget extends StatelessWidget {
  const GarageEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmptyScreenWidget(
          imagePath: "assets/images/garage_empty_image.png",
          imageWidth: 300.w,
          imageHeight: 285.h,
          firstTextSpan: "Oops!!\n",
          secondTextSpan: "Your Garage Is Empty",
          description:
              "Add your cars to \"My Garage\" for a personalized experience and quick access to the parts you need.",
          firstTextStyle: TextStyles.font24RedSemiBold,
          secondTextStyle: TextStyles.font24DarkBlueSemiBold,
          leftPadding: 24.w,
          rightPadding: 24.w,
        ),
        const Spacer(),
        CustomMaterialButton(
          onClicked: () {
            context.pushNamed(Routes.loginScreen);
          },
          title: "Add New Car",
        ),
      ],
    ).setHorizontalAndVerticalPadding(16.w, 16.h);
  }
}
