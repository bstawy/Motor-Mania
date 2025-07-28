import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:notification_center/notification_center.dart';

import '../../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../../../../core/helpers/extensions/snackbar_ext.dart';
import '../../../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../../../main.dart';
import '../../../../logic/user_cubit/user_cubit.dart';
import 'user_header_loaded_widget.dart';
import 'user_header_loading_widget.dart';
import 'user_header_search_and_address_widget.dart';

class UserHeaderWidget extends StatefulWidget {
  const UserHeaderWidget({super.key});

  @override
  State<UserHeaderWidget> createState() => _UserHeaderWidgetState();
}

class _UserHeaderWidgetState extends State<UserHeaderWidget> {
  @override
  void initState() {
    super.initState();
    NotificationCenter().subscribe('default_vehicle_changed', (data) {
      context.read<UserCubit>().fetchUserData();
    });
  }

  @override
  void dispose() {
    NotificationCenter().unsubscribe('default_vehicle_changed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      bloc: context.read<UserCubit>(),
      listenWhen: (previous, current) {
        return current is UserCarSwitching || current is UserDataError;
      },
      buildWhen: (previous, current) {
        return current is UserDataLoading ||
            current is UserDataLoaded ||
            current is UserDataEmpty;
      },
      listener: (context, state) {
        if (state is UserCarSwitching) {
          context.loadingSnackBar("Switching car...");
        } else if (state is UserDataError) {
          context.errorSnackBar(state.error.message ?? "");
        }
      },
      builder: (context, state) {
        if (state is UserDataLoading) {
          return const UserHeaderLoadingWidget();
        } else if (state is UserDataEmpty) {
          return _buildUserEmptyData();
        } else if (state is UserDataLoaded) {
          return UserHeaderLoadedWidget(car: state.userCar!);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildUserEmptyData() {
    final TextTheme customTextStyles = navigatorKey.currentContext!.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const UserHeaderSearchAndAddressWidget(),
        Gap(16.h),
        Text(
          "No Car is Selected",
          style: customTextStyles.displaySmall?.copyWith(
            color: Colors.white,
          ),
        ),
        Gap(12.h),
        Text(
          "Go to Garage to select a car or add new one",
          style: customTextStyles.headlineSmall?.copyWith(
            color: ColorsManager.blueGrey,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        Gap(12.h),
      ],
    ).setHorizontalPadding(16.w);
  }
}
