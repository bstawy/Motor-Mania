import 'package:flutter/material.dart';

import '../../../../core/config/text/text_styles.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyles.font14GreyRegular,
        ),
        TextButton(
          onPressed: () {
            // TODO: Navigate to Sign up screen
          },
          child: Text(
            "Sign Up",
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
      ],
    );
  }
}
