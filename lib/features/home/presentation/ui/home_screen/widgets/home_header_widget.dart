import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../../core/config/theme/colors_manager.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../logic/cubit/user_cubit.dart';
import 'home_guest_user_header_widget.dart';
import 'home_logged_user_header_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isUserLogged = context.read<AppManagerCubit>().isUserLoggedIn;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 16.h, bottom: 30.h),
      decoration: BoxDecoration(
        color: ColorsManager.darkkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: isUserLogged
          ? BlocProvider<UserCubit>(
              create: (context) => getIt<UserCubit>(),
              child: const HomeLoggedUserHeaderWidget(),
            )
          : const HomeGuestUserHeaderWidget(),
    );
  }
}
