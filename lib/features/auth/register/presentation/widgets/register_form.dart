import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helpers/validators.dart';
import '../../../widgets/form_text_field.dart';
import '../../../widgets/password_validations.dart';
import '../../data/models/register_request_body.dart';
import '../../logic/register_cubit.dart';
import 'register_button_widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  bool isNameValid = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  void setupNameControllerListener() {
    _nameController.addListener(() {
      setState(() {
        isNameValid = _nameController.text.isNotEmpty;
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

  void register() async {
    if (_formKey.currentState!.validate()) {
      final RegisterRequestBodyModel requestBody = RegisterRequestBodyModel(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      context.read<RegisterCubit>().registerUser(requestBody: requestBody);
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    setupPasswordControllerListener();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormTextField(
            controller: _nameController,
            title: "Name",
            hint: "Enter your name",
            validator: (value) {
              if (value!.isEmpty) {
                return "Name is required";
              }
              return null;
            },
          ),
          Gap(16.h),
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
          Gap(16.h),
          RegisterButtonWidget(
            isNameValid: isNameValid,
            isEmailValid: isEmailValid,
            isPasswordValid: isPasswordValid,
            onPressed: () => register(),
          )
        ],
      ),
    );
  }
}
