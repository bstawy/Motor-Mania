import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/caching/navigation_data_manager.dart';
import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../widgets/form_text_field.dart';
import '../../../widgets/password_validations.dart';
import '../../data/models/register_request_body.dart';
import '../../logic/register_cubit.dart';

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

  bool registering = false;

  void setupPasswordControllerListener() {
    _passwordController.addListener(() {
      setState(() {
        hasLowerCase = Validators.hasLowerCase(_passwordController.text);
        hasUpperCase = Validators.hasUpperCase(_passwordController.text);
        hasSpecialCharacter =
            Validators.hasSpecialCharacter(_passwordController.text);
        hasNumber = Validators.hasNumber(_passwordController.text);
        hasMinLength = Validators.hasMinLength(_passwordController.text);
      });
    });
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
          BlocConsumer<RegisterCubit, RegisterState>(
            bloc: context.read<RegisterCubit>(),
            listener: (context, state) async {
              if (state is LoadingState) {
                setState(() {
                  registering = true;
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
                  registering = false;
                });
              }
            },
            builder: (context, state) {
              return CustomMaterialButton(
                onClicked: () {
                  register();
                },
                title: "Register",
                backgroundColor: ColorsManager.red,
                loading: registering,
              );
            },
          ),
        ],
      ),
    );
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
}
