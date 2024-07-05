import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Search"),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 11.h),
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 73,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/search_icon.svg"),
            Gap(8.w),
            Text(
              "Search",
              style: TextStyles.font12LightGreyMedium,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Barcode"),
                  ),
                );
              },
              child: SvgPicture.asset("assets/icons/barcode_icon.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
