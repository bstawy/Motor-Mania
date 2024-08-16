import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/helpers/enums/app_modes_enums.dart';
import '../../logic/user_cubit/user_cubit.dart';
import 'home_guest_header_widget.dart';
import 'home_user_header_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppMode appMode = context.watch<AppManagerCubit>().appMode;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: appMode == AppMode.guest ? 16.h : 8.h,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.darkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: appMode == AppMode.user
          ? BlocProvider<UserCubit>(
              create: (context) => getIt<UserCubit>(),
              child: const HomeUserHeaderWidget(),
            )
          : const HomeGuestHeaderWidget(),
    );
  }
}
