import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../widgets/form_text_field.dart';
import '../../../widgets/password_validations.dart';
import '../../data/models/login_request_body_model.dart';
import '../../logic/login_cubit.dart';
import 'login_button_widget.dart';

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

  void setupEmailControllerListener() {
    _emailController.addListener(() {
      setState(() {
        isEmailValid = Validators.validateEmail(_emailController.text) == null;
      });
    });
  }

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

  void login() {
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;

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
          Visibility(
            visible: _passwordController.text.isNotEmpty,
            child: Column(
              children: [
                Gap(16.h),
                PasswordValidations(
                  isPasswordEmpty: _passwordController.text.isEmpty,
                  hasLowerCase: hasLowerCase,
                  hasUpperCase: hasUpperCase,
                  hasSpecialCharacters: hasSpecialCharacter,
                  hasNumber: hasNumber,
                  hasMinLength: hasMinLength,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // TODO: Forget password screen
              },
              child: Text(
                "Forget Password?",
                style: customTextStyles.labelLarge?.copyWith(
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ),
          ),
          Gap(16.h),
          LoginButtonWidget(
            isEmailValid: isEmailValid,
            isPasswordValid: isPasswordValid,
            onPressed: () => login(),
          ),
        ],
      ),
    );
  }
}
