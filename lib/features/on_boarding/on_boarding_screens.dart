import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/config/routing/routes.dart';
import '../../core/config/text/text_styles.dart';
import '../../core/config/theme/colors_manager.dart';
import '../../core/helpers/extensions/extensions.dart';
import '../../core/widgets/custom_material_button.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final List<Widget> _pages = [
    SizedBox(
      width: 175.w,
      height: 268.h,
      child: Image.asset(
        'assets/images/on_boarding_header.png',
        fit: BoxFit.contain,
      ),
    ),
    SizedBox(
      child: Text(
        "Unlock the World of Automotive Treasures.",
        style: TextStyles.font30WhiteBold,
        textAlign: TextAlign.start,
      ),
    ),
  ];

  int _currentPage = 0;

  bool isLastPage() {
    return _currentPage == _pages.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      padding: EdgeInsets.symmetric(
          horizontal: isLastPage() ? 24.w : 52.w, vertical: 40.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/on_boarding_background.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              _pages[_currentPage],
              const Spacer(),
              buildOnBoardingButton(),
            ],
          ),
        ),
      ),
    );
  }

  CustomMaterialButton buildOnBoardingButton() {
    return CustomMaterialButton(
      onClicked: () {
        if (isLastPage()) {
          // TODO: check if user previously login
          //context.pushNamed(Routes.loginScreen);
          context.pushNamed(Routes.homeScreen);
        } else {
          setState(() {
            _currentPage++;
          });
        }
      },
      title: isLastPage() ? 'Get Started' : 'Next',
      titleStyle: isLastPage()
          ? TextStyles.font16WhiteSemiBold
          : TextStyles.font16WhiteSemiBold.copyWith(color: ColorsManager.red),
      backgroundColor: isLastPage() ? ColorsManager.red : Colors.white,
      elevation: 0,
    );
  }
}
