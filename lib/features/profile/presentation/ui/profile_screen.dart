import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../core/helpers/enums/app_modes_enums.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../logic/profile_cubit.dart';
import 'widgets/options_grid_widget.dart';
import 'widgets/options_list_widget.dart';
import 'widgets/user_name_and_email_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () {
          context.read<LayoutCubit>().changeTab(0);
        },
        title: "Profile",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UserNameAndEmailWidget(
              name: "Mohamed Bastawy",
              email: "mohamed.bastawiie@gmail.com",
            ),
            Visibility(
              visible: context.read<AppManagerCubit>().appMode != AppMode.guest,
              maintainState: true,
              child: Column(
                children: [
                  Gap(8.h),
                  SizedBox(
                    height: 132.h,
                    child: const OptionsGridWidget(),
                  ),
                  Gap(24.h),
                  SizedBox(
                    height: 263.h,
                    child: OptionsListWidget(
                      title: "My Account",
                      options: context.read<ProfileCubit>().accountOptions,
                    ),
                  ),
                ],
              ),
            ),
            Gap(16.h),
            SizedBox(
              height: 263.h,
              child: OptionsListWidget(
                title: "Settings",
                options: context.read<ProfileCubit>().settingsOptions,
              ),
            ),
            Gap(16.h),
          ],
        ),
      ).setOnlyPadding(16.h, 0, 16.w, 16.w),
    );
  }
}
