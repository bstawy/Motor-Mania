import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/extensions/extensions.dart';

class BestSellerGridItem extends StatelessWidget {
  final String imagePath;
  const BestSellerGridItem({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(8.h),
              SizedBox(
                width: 100.w,
                height: 85.h,
                child: Image.asset(imagePath),
              ),
              Gap(8.h),
              Text(
                "Brembo 5520",
                style: TextStyles.font16DarkBlueBold,
              ),
              Text(
                "i8 Brake Caliper",
                style: TextStyles.font10DarkBlueRegular,
              ),
              Gap(5.h),
              Text(
                """Brembo brake pads represent the best in terms of performance, comfort and durability.""",
                style: TextStyles.font8LightGreyRegular,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(8.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: ColorsManager.red,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/cart_icon.svg"),
                          Gap(6.w),
                          Text(
                            "Add to cart",
                            style: TextStyles.font7WhiteMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(8.w),
                  Text(
                    "\$ 120",
                    style: TextStyles.font8LightGreyBold,
                  )
                ],
              )
            ],
          ).setHorizontalPadding(8.w),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5.r),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.lighterGrey,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/icons/favorite_icon.svg"),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: ColorsManager.red,
              ),
              alignment: Alignment.center,
              child: Text(
                "NEW",
                style: TextStyles.font7WhiteMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
