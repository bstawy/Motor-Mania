import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../../core/config/routing/routes.dart';
import '../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../core/widgets/custom_material_button.dart';
import '../../../logic/register_cubit/register_cubit.dart';

class RegisterButtonWidget extends StatelessWidget {
  final bool isNameValid, isEmailValid, isPasswordValid;
  final VoidCallback? onPressed;

  const RegisterButtonWidget({
    super.key,
    required this.isNameValid,
    required this.isEmailValid,
    required this.isPasswordValid,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      bloc: context.read<RegisterCubit>(),
      listener: (context, state) async {
        if (state is SuccessState) {
          context.read<AppManagerCubit>().logUserIn();

          if (context.mounted) {
            context.pushNamedAndRemoveUntil(
              Routes.layoutScreen,
              predicate: (route) => false,
            );
          }
        } else if (state is ErrorState) {
          context.errorSnackBar(state.error.message);
        }
      },
      builder: (context, state) {
        final bool registering = state is LoadingState;

        return GestureDetector(
          onTap: onPressed,
          child: CustomMaterialButton(
            onClicked: isNameValid && isEmailValid && isPasswordValid
                ? onPressed
                : null,
            title: "Register",
            backgroundColor: ColorsManager.red,
            loading: registering,
          ),
        );
      },
    );
  }
}
