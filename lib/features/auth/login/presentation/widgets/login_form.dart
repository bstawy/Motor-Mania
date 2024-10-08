import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/caching/navigation_data_manager.dart';
import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../widgets/form_text_field.dart';
import '../../../widgets/password_validations.dart';
import '../../data/models/login_request_body_model.dart';
import '../../logic/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool logging = false;

  void setupPasswordControllerListener() {
    _passwordController.addListener(() {
      setState(() {
        hasLowerCase = Validators.hasLowerCase(_passwordController.text);
        hasUpperCase = Validators.hasUpperCase(_passwordController.text);
        hasSpecialCharacter =
            Validators.hasSpecialCharacter(_passwordController.text);
        hasNumber = Validators.hasNumber(_passwordController.text);
        hasMinLength = Validators.hasMinLength(_passwordController.text);

        isPasswordValid = hasLowerCase &&
            hasUpperCase &&
            hasSpecialCharacter &&
            hasNumber &&
            hasMinLength;
      });
    });
  }

  void setupEmailControllerListener() {
    _emailController.addListener(() {
      setState(() {
        isEmailValid = Validators.validateEmail(_emailController.text) == null;
      });
    });
  }

  void login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      LoginRequestBodyModel requestBody = LoginRequestBodyModel(
        email: _emailController.text,
        password: _passwordController.text,
      );
      context.read<LoginCubit>().login(requestBody);
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    setupPasswordControllerListener();
    setupEmailControllerListener();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormTextField(
            controller: _emailController,
            title: "Email",
            hint: "Enter your email",
            validator: (value) => Validators.validateEmail(value),
          ),
          Gap(16.h),
          FormTextField(
            controller: _passwordController,
            title: "Password",
            hint: "Enter your password",
            isPassword: true,
            scrollPadding: 300.h,
            validator: (value) => Validators.validatePassword(value),
            action: TextInputAction.done,
          ),
          Gap(16.h),
          Visibility(
            visible: _passwordController.text.isNotEmpty,
            child: PasswordValidations(
              isPasswordEmpty: _passwordController.text.isEmpty,
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacter,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
          ),
          Gap(4.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // TODO: Forget password screen
              },
              child: Text(
                "Forget Password?",
                style: TextStyles.font12DarkBlueRegular,
              ),
            ),
          ),
          Gap(16.h),
          BlocConsumer<LoginCubit, LoginState>(
            bloc: context.read<LoginCubit>(),
            listener: (context, state) async {
              if (state is LoadingState) {
                setState(() {
                  logging = true;
                });
              } else if (state is SuccessState) {
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
                    predicate: (route) => false,
                    arguments: args,
                  );
                }
              } else if (state is ErrorState) {
                context.errorSnackBar(state.message);

                setState(() {
                  logging = false;
                });
              }
            },
            builder: (context, state) {
              return CustomMaterialButton(
                onClicked: isEmailValid && isPasswordValid
                    ? () {
                        login(context);
                      }
                    : null,
                title: "Login",
                backgroundColor: ColorsManager.red,
                loading: logging,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
