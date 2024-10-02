import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
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
          return Center(
            child: Text(state.failure.message ?? "Error loading car brands"),
          );
        } else if (state is CarBrandsLoaded || state is CarBrandSelected) {
          List<CarBrandEntity> carBrands = (state is CarBrandsLoaded)
              ? state.carBrands
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose Car Brand",
              style: TextStyles.font14DarkBlueSemiBold(),
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.carsBrands);
              },
              child: Text(
                "See All",
                style: TextStyles.font10RedRegular,
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
