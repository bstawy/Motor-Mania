import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/config/routing/routes.dart';
import '../../core/config/text/text_styles.dart';
import '../../core/helpers/extensions/extensions.dart';
import '../../core/widgets/custom_material_button.dart';
import 'on_boarding_model.dart';
import 'widgets/on_boarding_item_widget.dart';
import 'widgets/on_boarding_skip_button_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int currentPageIndex = 0;
  String buttonText = 'Next';

  final List<OnBoardingModel> _onBoardingList = [
    OnBoardingModel(
      title: 'Welcome to',
      subtitle: 'Motor Mania!',
      description:
          'Welcome to the ultimate destination for all your automotive needs. Whether you’re looking for replacement parts, upgrades, or maintenance essentials, we’ve got you covered.',
      image: 'assets/images/onboarding_car_image_01.png',
      imageAlignment: Alignment.centerRight,
    ),
    OnBoardingModel(
      title: 'Personalize your',
      subtitle: 'experience',
      description:
          'Enhance your shopping experience by adding your vehicles to \'My Garage\'. This personalized space allows you to manage multiple cars, each with its own profile.',
      image: 'assets/images/onboarding_car_image_02.png',
      imageAlignment: Alignment.center,
    ),
    OnBoardingModel(
      title: 'Find the right',
      subtitle: 'parts quickly',
      description:
          'Our advanced filtering system lets you search by part type, brand, price, and more, ensuring you find exactly what you need.',
      image: 'assets/images/onboarding_car_image_03.png',
      imageAlignment: Alignment.centerRight,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap(16.h),
            Visibility(
              visible: currentPageIndex != 2,
              replacement: SizedBox(height: 50.h),
              child: const Align(
                alignment: Alignment.centerRight,
                child: OnBoardingSkipButtonWidget(),
              ).setHorizontalPadding(24.w),
            ),
            Gap(48.h),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPageIndex = value;
                    buttonText = value == 2 ? 'Get Started' : 'Next';
                  });
                },
                children: _onBoardingList
                    .map(
                      (onBoarding) => OnBoardingItemWidget(
                        onBoarding: onBoarding,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: CustomMaterialButton(
          onClicked: () {
            if (_pageController.page == 2) {
              context.pushReplacementNamed(Routes.layoutScreen);
            } else {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          title: buttonText,
          titleStyle: TextStyles.font14WhiteSemiBold,
          height: 45.h,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
