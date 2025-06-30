import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../core/config/routing/routes.dart';
import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../core/helpers/assets_manager.dart';
import '../../../../core/helpers/enums/app_modes_enums.dart';
import '../../../../core/helpers/extensions/navigation_ext.dart';
import '../../../../core/helpers/extensions/theme_ext.dart';
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
    final customTextStyles = context.textStyles;

    return CustomElevatedButton(
      onPressed: () {
        context.pushNamed(Routes.cars);
      },
      title: "Add New Car",
      titleStyle: customTextStyles.labelLarge?.copyWith(
        color: ColorsManager.blueGrey,
        fontWeight: FontWeightHelper.regular,
      ),
      iconPath: AssetsManager.addIcon,
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
                return current is GarageLoading ||
                    current is GarageLoaded ||
                    current is GarageEmpty ||
                    current is GarageError;
              },
              builder: (context, state) {
                if (state is GarageLoading) {
                  return const GarageLoadingWidget();
                } else if (state is GarageEmpty) {
                  return const GarageEmptyWidget();
                } else if (state is GarageLoaded) {
                  return GarageCarsListWidget(garageCars: state.cars ?? []);
                } else if (state is GarageError) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<GarageCubit>().getGarageCars();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Center(
                        child: Text(state.error.message ?? ""),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
    );
  }
}
