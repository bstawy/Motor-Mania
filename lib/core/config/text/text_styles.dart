import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors_manager.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font32DarkBlueSemiBold = TextStyle(
    color: ColorsManager.darkkBlue,
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Montserrat',
  );

  static TextStyle font30WhiteBold = TextStyle(
    color: Colors.white,
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'Montserrat',
  );

  static TextStyle font16DarkBlueSemiBold = TextStyle(
    color: ColorsManager.darkkBlue,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Montserrat',
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Montserrat',
  );

  static TextStyle font16DarkBlueMedium = TextStyle(
    color: ColorsManager.darkkBlue,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Montserrat',
  );

  static TextStyle font16GreyRegular = TextStyle(
    color: ColorsManager.grey,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Montserrat',
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    color: ColorsManager.darkkBlue,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'Montserrat',
  );

  static TextStyle font14DarkBlueRegular = TextStyle(
    color: ColorsManager.darkkBlue,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Montserrat',
  );

  static TextStyle font14GreyRegular = TextStyle(
    color: ColorsManager.grey,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Montserrat',
  );

  static TextStyle font12DarkBlueRegular = TextStyle(
    color: ColorsManager.darkkBlue,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Montserrat',
  );
}
