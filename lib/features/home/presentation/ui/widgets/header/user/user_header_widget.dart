import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../../../core/config/routing/app_router.dart';
import '../../../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../logic/user_cubit/user_cubit.dart';
import 'user_header_loaded_widget.dart';
import 'user_header_loading_widget.dart';
import 'user_header_search_and_address_widget.dart';

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      bloc: context.read<UserCubit>()..fetchUserData(),
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
          context.errorSnackBar(state.failure.message ?? "");
        }
      },
      builder: (context, state) {
        if (state is UserDataLoading) {
          return const UserHeaderLoadingWidget();
        } else if (state is UserDataEmpty) {
          return _buildUserEmptyData();
        } else if (state is UserDataLoaded) {
          context.read<AppManagerCubit>().selectedCarId = state.userCar.id!;
          return UserHeaderLoadedWidget(car: state.userCar);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildUserEmptyData() {
    final TextTheme customTextStyles =
        AppRouter.navigatorKey.currentContext!.textStyles;

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
