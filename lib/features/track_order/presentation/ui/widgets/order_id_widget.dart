import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';

class OrderIdWidget extends StatelessWidget {
  final String id;
  const OrderIdWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Order ID ",
              style: TextStyles.font12BlueGreyRegular,
              children: [
                TextSpan(
                  text: id,
                  style: TextStyles.font12BlueGreySemiBold,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              try {
                await Clipboard.setData(
                  ClipboardData(text: id),
                );

                if (context.mounted) {
                  context.successSnackBar(
                    "Order ID copied to Clipboard!",
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  context.successSnackBar(
                    "Failed to copy to clipboard",
                  );
                }
              }
            },
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: ColorsManager.red.withOpacity(0.2),
                ),
                child: SvgPicture.asset("assets/icons/copy_icon.svg")),
          ),
        ],
      ),
    );
  }
}
