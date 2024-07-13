import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/config/text/text_styles.dart';
import '../../../../../../core/config/theme/colors_manager.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Search Bar")),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.transparent,
          border: Border.all(
            color: ColorsManager.lightGrey,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/search_icon.svg",
              colorFilter: const ColorFilter.mode(
                ColorsManager.lightGrey,
                BlendMode.srcIn,
              ),
            ),
            Gap(8.w),
            Text(
              "Search",
              style: TextStyles.font12LightGreyMedium,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Barcode")),
                );
              },
              child: SvgPicture.asset(
                "assets/icons/barcode_icon.svg",
                colorFilter: const ColorFilter.mode(
                  ColorsManager.lightGrey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
