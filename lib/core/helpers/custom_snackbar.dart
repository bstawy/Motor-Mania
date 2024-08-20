import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../config/text/text_styles.dart';
import 'enums/status_enum.dart';

class CustomSnackBar {
  static _buildCustomBotToast(
      BuildContext context, StatusEnum status, String msg) {
    BotToast.showCustomNotification(
      useSafeArea: true,
      crossPage: true,
      dismissDirections: [DismissDirection.startToEnd],
      duration: const Duration(
        milliseconds: 2000,
      ),
      toastBuilder: (void Function() cancelFunc) {
        return _buildNotificationWidget(context, status: status, msg: msg);
      },
    );
  }

  static void showSuccessMessage(BuildContext context, String msg) {
    _buildCustomBotToast(context, StatusEnum.success, msg);
  }

  static void showLoadingMessage(BuildContext context, String msg) {
    _buildCustomBotToast(context, StatusEnum.loading, msg);
  }

  static void showErrorMessage(BuildContext context, String msg) {
    _buildCustomBotToast(context, StatusEnum.error, msg);
  }

  static Widget _buildNotificationWidget(
    BuildContext context, {
    required StatusEnum status,
    required String msg,
  }) {
    late String lottiePath;

    switch (status) {
      case StatusEnum.loading:
        lottiePath = "assets/animation/loading_animation.json";
        break;
      case StatusEnum.success:
        lottiePath = "assets/animation/success_animation.json";
        break;
      case StatusEnum.error:
        lottiePath = "assets/animation/error_animation.json";
        break;
    }

    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              lottiePath,
              width: 35.w,
              height: 35.h,
              repeat: false,
            ),
            Gap(8.w),
            Expanded(
              child: Text(
                msg,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font12DarkBlueMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
