import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../logic/user_cubit/user_cubit.dart';
import 'user_header_loaded_widget.dart';
import 'user_header_loading_widget.dart';

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
        return current is UserDataLoading || current is UserDataLoaded;
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
        } else if (state is UserDataLoaded) {
          context.read<AppManagerCubit>().selectedCarId = state.userCar.id!;
          return UserHeaderLoadedWidget(car: state.userCar);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
