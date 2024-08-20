import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';

class LogoutAlertDialogWidget extends StatelessWidget {
  const LogoutAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Logout',
        style: TextStyles.font16DarkBlueBold,
      ),
      content: Text(
        'Are you sure you want to logout?',
        style: TextStyles.font14DarkBlueMedium,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'No',
            style: TextStyles.font12RedSemiBold,
          ),
        ),
        TextButton(
          onPressed: () async {
            await context.read<AppManagerCubit>().logUserOut();
            if (context.mounted) {
              Navigator.of(context).pop(true);

              context.pushNamedAndRemoveUntil(
                Routes.onBoardingScreens,
                predicate: (route) => false,
              );
            }
          },
          child: Text(
            'Yes',
            style: TextStyles.font12DarkBlueSemiBold,
          ),
        ),
      ],
    );
  }
}
