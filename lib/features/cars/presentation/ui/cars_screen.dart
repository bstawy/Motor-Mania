import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../auth/login/logic/login_cubit.dart';
import '../logic/cars_cubit.dart';
import 'widgets/add_car_listener.dart';
import 'widgets/car_brands_kilometers_field_widget.dart';
import 'widgets/car_brands_list_widget.dart';
import 'widgets/car_data_form_field_widget.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<CarsCubit>().reset();
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Add a New Car',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddCarListener(),
              const CarBrandsListWidget(),
              Gap(16.h),
              BlocBuilder<CarsCubit, CarsState>(
                bloc: context.read<CarsCubit>(),
                buildWhen: (previous, current) =>
                    current is CarBrandModelsLoaded ||
                    current is CarBrandSelected,
                builder: (context, state) {
                  return CarDataFormFieldWidget(
                    title: "Choose Car Model",
                    options: context
                        .read<CarsCubit>()
                        .carModels
                        .map((e) => e.name)
                        .toList(),
                    onSelect: (value) {
                      context.read<CarsCubit>().selectCarModel(value);
                    },
                    isEnabled:
                        context.read<CarsCubit>().selectedCarBrandId != null &&
                            context.read<CarsCubit>().carModels.isNotEmpty,
                  );
                },
              ),
              Gap(16.h),
              BlocBuilder<CarsCubit, CarsState>(
                bloc: context.read<CarsCubit>(),
                buildWhen: (previous, current) =>
                    current is CarBrandsLoaded || current is CarModelSelected,
                builder: (context, state) {
                  return CarDataFormFieldWidget(
                    title: "Choose Car Year",
                    options: context
                        .read<CarsCubit>()
                        .carModels
                        .map((e) => e.year)
                        .toList(),
                    onSelect: (value) {
                      context.read<CarsCubit>().selectCarYear(value);
                      context.successSnackBar("Car Year Selected");
                    },
                    isEnabled:
                        context.read<CarsCubit>().selectedCarModel != null,
                  );
                },
              ),
              Gap(16.h),
              BlocBuilder<CarsCubit, CarsState>(
                bloc: context.read<CarsCubit>(),
                buildWhen: (previous, current) =>
                    current is CarBrandsLoaded || current is CarYearSelected,
                builder: (context, state) {
                  return CarBrandsKilometersFieldWidget(
                    isEnabled:
                        context.read<CarsCubit>().selectedCarYear != null,
                  );
                },
              ),
            ],
          ).setVerticalPadding(16.h),
        ),
        bottomNavigationBar: BlocBuilder<CarsCubit, CarsState>(
          bloc: context.read<CarsCubit>(),
          buildWhen: (previous, current) {
            return current is! InitialState ||
                current is! CarBrandsLoading ||
                current is! CarBrandsError ||
                current is! CarDataCompleted;
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context.read<CarsCubit>().checkCarDataCompleted()
                  ? null
                  : context.errorSnackBar("Please fill all fields"),
              child: CustomMaterialButton(
                onClicked: context.read<CarsCubit>().checkCarDataCompleted()
                    ? () {
                        context.read<CarsCubit>().addCar(context);
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
}

/*
BlocBuilder<CarsCubit, CarsState>(
          bloc: context.read<CarsCubit>(),
          buildWhen: (previous, current) {
            return current is! InitialState || current is! CarDataCompleted;

            // current is CarBrandsLoading ||
            //     current is CarBrandsLoaded ||
            //     current is CarBrandsError ||
            //     current is CarBrandSelected ||
            //     current is CarModelSelected ||
            //     current is CarYearSelected ||
            //     current is CarKilometersSelected;
          },
          builder: (context, state) {
            if (state is CarBrandsLoading) {
              return const CarBrandsLoadingWidget();
            } else if (state is CarBrandsError) {
              return Center(
                child:
                    Text(state.failure.message ?? "Error loading car brands"),
              );
            } else {
              return 
            }
          },
        )
*/