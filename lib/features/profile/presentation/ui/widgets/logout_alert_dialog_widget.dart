import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/caching/hive_manager.dart';
import '../../../../../core/caching/tokens_manager.dart';
import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../main.dart';

class LogoutAlertDialogWidget extends StatelessWidget {
  const LogoutAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return AlertDialog(
      backgroundColor: customColors.inversePrimary,
      title: Text(
        'Logout',
        style: customTextStyles.headlineLarge,
      ),
      content: Text(
        'Are you sure you want to logout?',
        style: customTextStyles.headlineMedium?.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'Cancel',
            style: customTextStyles.headlineSmall?.copyWith(
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await context.read<AppManagerCubit>().logUserOut();
            if (context.mounted) {
              await getIt<HiveManager>().clearAllBoxes();
              await TokensManager.deleteTokens();

              navigatorKey.currentState!.pushNamedAndRemoveUntil(
                Routes.onBoardingScreens,
                (route) => false,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.red,
          ),
          child: Text(
            'Logout',
            style: customTextStyles.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
