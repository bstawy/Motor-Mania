import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../cubit/car_brands_cubit.dart';
import 'widgets/car_brands_form_field_widget.dart';
import 'widgets/car_brands_kilometers_field_widget.dart';
import 'widgets/car_brands_list_widget.dart';
import 'widgets/car_brands_loading_widget.dart';

class CarBrandsScreen extends StatelessWidget {
  const CarBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add a New Car',
      ),
      body: BlocBuilder<CarBrandsCubit, CarBrandsState>(
        bloc: context.read<CarBrandsCubit>(),
        builder: (context, state) {
          if (state is CarBrandsLoading) {
            return const CarBrandsLoadingWidget();
          } else if (state is CarBrandsLoaded ||
              state is CarBrandSelected ||
              state is CarModelSelected ||
              state is CarYearSelected ||
              state is CarKilometersSelected) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarBrandsListWidget(
                    carBrands:
                        context.read<CarBrandsCubit>().carBrands.sublist(0, 5),
                  ),
                  Gap(16.h),
                  CarBrandsFormFieldWidget(
                      title: "Choose Car Model",
                      options: const [
                        'Model 1',
                        'Model 2',
                        'Model 3',
                        'Model 4',
                      ],
                      onSelect: (value) {
                        context.read<CarBrandsCubit>().selectCarModel(value);
                        context.successSnackBar("Car Model Selected");
                      }),
                  Gap(16.h),
                  CarBrandsFormFieldWidget(
                      title: "Choose Car Year",
                      options: const [
                        2012,
                        2013,
                        2014,
                        2015,
                      ],
                      onSelect: (value) {
                        context.read<CarBrandsCubit>().selectCarYear(value);
                        context.successSnackBar("Car Year Selected");
                      }),
                  Gap(16.h),
                  const CarBrandsKilometersFieldWidget(),
                ],
              ).setVerticalPadding(16.h),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<CarBrandsCubit, CarBrandsState>(
        bloc: context.read<CarBrandsCubit>(),
        buildWhen: (previous, current) =>
            current is CarBrandsLoaded ||
            current is CarKilometersSelected ||
            current is CarBrandSelected ||
            current is CarModelSelected ||
            current is CarYearSelected,
        builder: (context, state) {
          if (state is CarBrandsLoading) {
            return const SizedBox.shrink();
          }
          return CustomMaterialButton(
            onClicked: checkDataCompleted(context) ? () {} : null,
            title: "Add Car",
          );
        },
      ).setHorizontalAndVerticalPadding(16.w, 16.h),
    );
  }

  bool checkDataCompleted(BuildContext context) {
    final cubit = context.read<CarBrandsCubit>();
    debugPrint("Selected Car Brand ID: ${cubit.selectedCarBrandId}");
    debugPrint("Selected Car Model: ${cubit.selectedCarModel}");
    debugPrint("Selected Car Year: ${cubit.selectedCarYear}");
    debugPrint("Selected Car Kilometers: ${cubit.selectedCarKilometers}");
    return cubit.selectedCarModel != null &&
        cubit.selectedCarYear != null &&
        cubit.selectedCarKilometers != null;
  }
}
