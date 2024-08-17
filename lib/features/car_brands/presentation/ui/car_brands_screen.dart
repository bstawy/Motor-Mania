import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../cubit/car_brands_cubit.dart';
import 'widgets/car_added_success_sheet_widget.dart';
import 'widgets/car_brands_form_field_widget.dart';
import 'widgets/car_brands_kilometers_field_widget.dart';
import 'widgets/car_brands_list_widget.dart';
import 'widgets/car_brands_loading_widget.dart';

class CarBrandsScreen extends StatelessWidget {
  const CarBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<CarBrandsCubit>().reset();
      },
      child: Scaffold(
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
                      carBrands: context
                          .read<CarBrandsCubit>()
                          .carBrands
                          .sublist(0, 5),
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
                      },
                      isEnabled:
                          context.read<CarBrandsCubit>().selectedCarBrandId !=
                              null,
                    ),
                    Gap(16.h),
                    CarBrandsFormFieldWidget(
                      title: "Choose Car Year",
                      options: const [
                        2015,
                        2016,
                        2018,
                        2020,
                      ],
                      onSelect: (value) {
                        context.read<CarBrandsCubit>().selectCarYear(value);
                        context.successSnackBar("Car Year Selected");
                      },
                      isEnabled:
                          context.read<CarBrandsCubit>().selectedCarModel !=
                              null,
                    ),
                    Gap(16.h),
                    CarBrandsKilometersFieldWidget(
                      isEnabled:
                          context.read<CarBrandsCubit>().selectedCarYear !=
                              null,
                    ),
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
            return GestureDetector(
              onTap: () => checkDataCompleted(context)
                  ? null
                  : context.errorSnackBar("Please fill all fields"),
              child: CustomMaterialButton(
                onClicked: checkDataCompleted(context)
                    ? () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const CarAddedSuccessSheet(),
                          isScrollControlled: true,
                          useSafeArea: true,
                          backgroundColor: Colors.white,
                        );
                      }
                    : null,
                title: "Add Car",
              ),
            );
          },
        ).setHorizontalAndVerticalPadding(16.w, 16.h),
      ),
    );
  }

  bool checkDataCompleted(BuildContext context) {
    final cubit = context.read<CarBrandsCubit>();

    return cubit.selectedCarModel != null &&
        cubit.selectedCarYear != null &&
        cubit.selectedCarKilometers != null;
  }
}
