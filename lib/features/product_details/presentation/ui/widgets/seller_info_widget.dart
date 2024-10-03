import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';

class SellerInfoWidget extends StatelessWidget {
  const SellerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 22.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/store_icon.svg",
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
                      style: TextStyles.font10DarkBlueRegular,
                      children: [
                        TextSpan(
                          text: "Brembo",
                          style: TextStyles.font10DarkBlueMedium,
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
                          color: const Color(0xff171823),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star_icon.svg",
                              width: 6.w,
                              height: 6.h,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            Gap(4.w),
                            Text(
                              '4.2',
                              style: TextStyles.font10WhiteMedium.copyWith(
                                fontSize: 5.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(4.w),
                      Text(
                        "92% Positive Seller Rating",
                        style: TextStyles.font10BlueGreyRegular,
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
              color: ColorsManager.whiteBlue,
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
                      "assets/icons/box_icon.svg",
                      width: 24.w,
                      height: 24.h,
                    ),
                    Gap(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Items as Described",
                          style: TextStyles.font10DarkBlueMedium,
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
                                color: ColorsManager.whiteBlue,
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
                              style: TextStyles.font10BlueGreySemiBold,
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
                    "assets/icons/partner_icon.svg",
                    width: 24.w,
                    height: 24.h,
                  ),
                  Gap(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Partner Since",
                        style: TextStyles.font10DarkBlueMedium,
                      ),
                      Text(
                        "+2 Years",
                        style: TextStyles.font10RedSemiBold,
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
                      "assets/icons/low_return_rate_icon.svg",
                      width: 24.w,
                      height: 24.h,
                    ),
                    Gap(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Low Return Seller",
                          style: TextStyles.font10DarkBlueMedium,
                        ),
                        Text(
                          "Last 8 Months",
                          style: TextStyles.font10RedSemiBold,
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
                      "assets/icons/like_icon.svg",
                      width: 24.w,
                      height: 24.h,
                    ),
                    Gap(8.w),
                    Expanded(
                      child: Text(
                        "Great Recent Rating",
                        style: TextStyles.font10DarkBlueMedium,
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
