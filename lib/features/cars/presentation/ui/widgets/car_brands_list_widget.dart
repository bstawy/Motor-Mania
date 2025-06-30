import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/shimmer_loading_widget.dart';
import '../../../domain/entities/car_brand_entity.dart';
import '../../logic/cars_cubit.dart';
import 'car_brand_item_widget.dart';

class CarBrandsListWidget extends StatelessWidget {
  const CarBrandsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsCubit, CarsState>(
      bloc: context.read<CarsCubit>(),
      buildWhen: (previous, current) {
        return current is CarBrandsLoading ||
            current is CarBrandsLoaded ||
            current is CarBrandSelected ||
            current is CarBrandsError;
      },
      builder: (context, state) {
        if (state is CarBrandsLoading) {
          return _buildCarBrandsLoadingWidget();
        } else if (state is CarBrandsError) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<CarsCubit>().getCarBrands();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Center(
                child: Text(state.error.message ?? "Error loading car brands"),
              ),
            ),
          );
        } else if (state is CarBrandsLoaded || state is CarBrandSelected) {
          List<CarBrandEntity> carBrands = (state is CarBrandsLoaded)
              ? state.carBrands ?? []
              : (state is CarBrandSelected)
                  ? state.carBrands
                  : context.read<CarsCubit>().carBrands;

          return carBrandsList(context, carBrands);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildCarBrandsLoadingWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoadingWidget(
          width: 100.w,
          height: 20.h,
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            separatorBuilder: (context, index) => Gap(8.w),
            itemBuilder: (context, index) {
              return ShimmerLoadingWidget(
                width: 100.w,
                height: 100.h,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget carBrandsList(BuildContext context, List<CarBrandEntity> carBrands) {
    final customTextStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose Car Brand",
              style: customTextStyles.headlineMedium?.copyWith(
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.carsBrands);
              },
              child: Text(
                "See All",
                style: customTextStyles.labelLarge?.copyWith(
                  color: ColorsManager.red,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ),
          ],
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: carBrands.length > 5 ? 5 : carBrands.length,
            separatorBuilder: (context, index) => Gap(8.w),
            itemBuilder: (context, index) {
              return CarBrandItemWidget(
                carBrand: carBrands[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
