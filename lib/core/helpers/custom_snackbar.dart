import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/text/text_styles.dart';

class CustomSnackBar {
  static void showSuccessMessage(BuildContext context, String msg) {
    BotToast.showCustomNotification(
      useSafeArea: true,
      crossPage: true,
      dismissDirections: [DismissDirection.startToEnd],
      duration: const Duration(
        seconds: 2,
      ),
      toastBuilder: (void Function() cancelFunc) {
        return _buildNotificationWidget(context, success: true, msg: msg);
      },
    );
  }

  static void showErrorMessage(BuildContext context, String msg) {
    BotToast.showCustomNotification(
      useSafeArea: true,
      crossPage: true,
      dismissDirections: [DismissDirection.endToStart],
      duration: const Duration(
        seconds: 2,
      ),
      toastBuilder: (void Function() cancelFunc) {
        return _buildNotificationWidget(context, success: false, msg: msg);
      },
    );
  }

  static Widget _buildNotificationWidget(
    BuildContext context, {
    required bool success,
    required String msg,
  }) {
    final theme = Theme.of(context);

    Color msgTextColor =
        (success) ? theme.colorScheme.primary : theme.colorScheme.error;

    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 11.h, left: 16.w, right: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
        alignment: Alignment.center,
        child: Text(
          msg,
          textAlign: TextAlign.center,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font14DarkBlueSemiBold.copyWith(
            color: msgTextColor,
          ),
        ),
      ),
    );
  }
}
