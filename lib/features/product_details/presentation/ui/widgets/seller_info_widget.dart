import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/assets_manager.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../main.dart';

class SellerInfoWidget extends StatelessWidget {
  const SellerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 22.w,
      ),
      decoration: BoxDecoration(
        color: customColors.inversePrimary,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                themeIsDark
                    ? AssetsManager.storeDarkIcon
                    : AssetsManager.storeIcon,
                width: 24.w,
                height: 24.h,
              ),
              Gap(8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Sold by ",
                      style: customTextStyles.labelLarge?.copyWith(
                        fontWeight: FontWeightHelper.regular,
                      ),
                      children: [
                        TextSpan(
                          text: "Brembo",
                          style: customTextStyles.labelLarge?.copyWith(
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(2.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.h,
                          horizontal: 4.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: customColors.primary,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetsManager.starIcon,
                              width: 6.w,
                              height: 6.h,
                              colorFilter: ColorFilter.mode(
                                customColors.inversePrimary,
                                BlendMode.srcIn,
                              ),
                            ),
                            Gap(4.w),
                            Text(
                              '4.2',
                              style: customTextStyles.labelLarge?.copyWith(
                                color: customColors.inversePrimary,
                                fontSize: 5.sp,
                                fontWeight: FontWeightHelper.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(4.w),
                      Text(
                        "92% Positive Seller Rating",
                        style: customTextStyles.labelLarge?.copyWith(
                          color: ColorsManager.blueGrey,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 24.r,
                  color: ColorsManager.blueGrey,
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 11.w,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.blueGrey,
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: (1.sw - 85.w) / 2,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      themeIsDark
                          ? AssetsManager.boxDarkIcon
                          : AssetsManager.boxIcon,
                      width: 24.w,
                      height: 24.h,
                    ),
                    Gap(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Items as Described",
                          style: customTextStyles.labelLarge?.copyWith(
                            fontWeight: FontWeightHelper.medium,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 60.w,
                              height: 4.h,
                              padding: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                color: ColorsManager.blueGrey,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Container(
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: ColorsManager.red,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                              ),
                            ),
                            Gap(8.w),
                            Text(
                              "90%",
                              style: customTextStyles.labelLarge?.copyWith(
                                color: ColorsManager.blueGrey,
                                fontWeight: FontWeightHelper.semiBold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(30.w),
              Row(
                children: [
                  SvgPicture.asset(
                    themeIsDark
                        ? AssetsManager.partnerDarkIcon
                        : AssetsManager.partnerIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  Gap(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Partner Since",
                        style: customTextStyles.labelLarge?.copyWith(
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                      Text(
                        "+2 Years",
                        style: customTextStyles.labelLarge?.copyWith(
                          color: ColorsManager.red,
                          fontWeight: FontWeightHelper.semiBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Gap(16.h),
          Row(
            children: [
              SizedBox(
                width: (1.sw - 85.w) / 2,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      themeIsDark
                          ? AssetsManager.profileLowReturnRateDarkIcon
                          : AssetsManager.profileLowReturnRateIcon,
                      width: 24.w,
                      height: 24.h,
                    ),
                    Gap(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Low Return Seller",
                          style: customTextStyles.labelLarge?.copyWith(
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                        Text(
                          "Last 8 Months",
                          style: customTextStyles.labelLarge?.copyWith(
                            color: ColorsManager.red,
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(30.w),
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      themeIsDark
                          ? AssetsManager.likeButtonDark
                          : AssetsManager.likeButton,
                      width: 24.w,
                      height: 24.h,
                    ),
                    Gap(8.w),
                    Expanded(
                      child: Text(
                        "Great Recent Rating",
                        style: customTextStyles.labelLarge?.copyWith(
                          fontWeight: FontWeightHelper.medium,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
