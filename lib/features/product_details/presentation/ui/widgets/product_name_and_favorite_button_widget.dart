import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/text/text_styles.dart';

class ProductNameAndFavoriteButtonWidget extends StatelessWidget {
  final String name;
  final String carModel;

  const ProductNameAndFavoriteButtonWidget({
    super.key,
    required this.name,
    required this.carModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyles.font24DarkBlueBold,
            ),
            Text(
              carModel,
              style: TextStyles.font14DarkBlueRegular,
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 40.w,
          height: 40.h,
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/icons/favorite_icon.svg",
            width: 24.r,
            height: 24.r,
          ),
        ),
      ],
    );
  }
}
