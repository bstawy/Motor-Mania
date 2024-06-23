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

  static TextStyle font16WhiteSemiBold = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Montserrat',
  );

  static TextStyle font16LightGreyRegular = TextStyle(
    color: ColorsManager.lightGrey,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Montserrat',
  );
}
