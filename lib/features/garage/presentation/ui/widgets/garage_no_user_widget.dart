import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/save_navigation_data.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/widgets/empty_screen_widget.dart';

class GarageNoUserWidget extends StatelessWidget {
  const GarageNoUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        EmptyScreenWidget(
          imagePath: AssetsManager.loginImage,
          darkImagePath: AssetsManager.loginImageDark,
          firstTextSpan: "Please, ",
          secondTextSpan: "Login First\n",
          thirdTextSpan: "To Add A Car",
          description:
              "Login and add your cars to \"My Garage\" for a personalized experience and quick access to the parts you need.",
          rightPadding: 16.w,
          leftPadding: 16.w,
        ),
        const Spacer(),
        CustomMaterialButton(
          onClicked: () {
            saveNavigationData(
              Routes.layoutScreen,
              2,
            );
            context.pushNamed(Routes.loginScreen);
          },
          title: "Login",
        ),
      ],
    ).setOnlyPadding(40.h, 16.h, 16.w, 16.w);
  }
}
