import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../core/config/routing/routes.dart';
import '../../../../core/config/text/text_styles.dart';
import '../../../../core/helpers/enums/app_modes_enums.dart';
import '../../../../core/helpers/extensions/navigation_ext.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../logic/garage_cubit.dart';
import 'widgets/garage_cars_list_widget.dart';
import 'widgets/garage_empty_widget.dart';
import 'widgets/garage_loading_widget.dart';
import 'widgets/garage_no_user_widget.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});

  Widget _buildAddNewCarButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        context.pushNamed(Routes.carBrands);
      },
      title: "Add New Car",
      titleStyle: TextStyles.font10BlueGreyMedium,
      iconPath: "assets/icons/add_icon.svg",
      iconWidth: 17.w,
      iconHeight: 17.h,
      borderRadiusValue: 12.r,
      horizontalPadding: 14.w,
      verticalPadding: 8.h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () {
          context.read<LayoutCubit>().changeTab(0);
        },
        title: "My Garage",
        actions: [
          BlocBuilder<GarageCubit, GarageState>(
            bloc: context.read<GarageCubit>(),
            builder: (context, state) {
              if (state is GarageLoading ||
                  context.read<AppManagerCubit>().appMode == AppMode.guest) {
                return const SizedBox();
              }
              return _buildAddNewCarButton(context);
            },
          ),
        ],
      ),
      body: context.read<AppManagerCubit>().appMode == AppMode.guest
          ? const GarageNoUserWidget()
          : BlocBuilder<GarageCubit, GarageState>(
              bloc: context.read<GarageCubit>()..getGarageCars(),
              buildWhen: (previous, current) {
                if (current is GarageLoading ||
                    current is GarageLoaded ||
                    current is GarageEmpty ||
                    current is GarageError) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is GarageLoading) {
                  return const GarageLoadingWidget();
                } else if (state is GarageEmpty) {
                  return const GarageEmptyWidget();
                } else if (state is GarageLoaded) {
                  return GarageCarsListWidget(
                    garageCars: state.cars,
                  );
                } else if (state is GarageError) {
                  return Center(
                    child: Text(state.failure.message ?? ""),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
    );
  }
}
