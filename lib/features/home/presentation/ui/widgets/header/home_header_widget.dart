import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../core/helpers/enums/app_modes_enums.dart';
import '../../../../../../main.dart';
import 'guest/guest_header_widget.dart';
import 'user/user_header_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppMode appMode = context.read<AppManagerCubit>().appMode;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 8.h,
      ),
      decoration: BoxDecoration(
        color: themeIsDark ? ColorsManager.darkBlue : ColorsManager.darkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: appMode == AppMode.user
          ? const UserHeaderWidget()
          : const GuestHeaderWidget(),
    );
  }
}
