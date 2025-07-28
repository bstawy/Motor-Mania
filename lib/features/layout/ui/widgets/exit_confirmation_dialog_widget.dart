import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/helpers/custom_snackbar.dart';

class ExitConfirmationDialogWidget extends StatelessWidget {
  const ExitConfirmationDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to exit an App'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              CustomSnackBar.showErrorMessage(
                context,
                'Please use system navigation bar to exit app',
              );
            }
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
