import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/caching/navigation_data_manager.dart';
import '../../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../../core/config/routing/routes.dart';
import '../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../core/widgets/custom_material_button.dart';
import '../../../logic/login_cubit/login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  final bool isEmailValid, isPasswordValid;
  final VoidCallback? onPressed;

  const LoginButtonWidget({
    super.key,
    required this.isEmailValid,
    required this.isPasswordValid,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: context.read<LoginCubit>(),
      listener: (context, state) async {
        if (state is SuccessState) {
          context.read<AppManagerCubit>().logUserIn();

          String navRoute = Routes.layoutScreen;
          int? args;

          final ScreenNavigationData? navigationData =
              await NavigationDataManager.getScreenNavigationData();

          if (navigationData != null) {
            navRoute = navigationData.previousScreenRouteName!;
            args = navigationData.previousScreenArguments;
          }

          if (context.mounted) {
            context.pushNamedAndRemoveUntil(
              navRoute,
              arguments: args,
              predicate: (route) => false,
            );
          }
        } else if (state is ErrorState) {
          context.errorSnackBar(state.error.message);
        }
      },
      builder: (context, state) {
        final bool isLoading = state is LoadingState;

        return GestureDetector(
          onTap: onPressed,
          child: CustomMaterialButton(
            onClicked: isEmailValid && isPasswordValid ? onPressed : null,
            title: "Login",
            backgroundColor: ColorsManager.red,
            loading: isLoading,
          ),
        );
      },
    );
  }
}
