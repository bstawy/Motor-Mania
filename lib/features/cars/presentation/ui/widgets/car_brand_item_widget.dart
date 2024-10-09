import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../domain/entities/car_brand_entity.dart';
import '../../logic/cars_cubit.dart';

class CarBrandItemWidget extends StatelessWidget {
  final CarBrandEntity carBrand;

  const CarBrandItemWidget({
    super.key,
    required this.carBrand,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    bool isSelected =
        context.read<CarsCubit>().selectedCarBrandId == carBrand.id;

    return GestureDetector(
      onTap: () {
        context.read<CarsCubit>().selectCarBrand(carBrand.id!);
      },
      child: BlocBuilder<CarsCubit, CarsState>(
        bloc: context.read<CarsCubit>(),
        builder: (context, state) {
          return Hero(
            tag: carBrand.id!,
            child: Container(
              width: 100.w,
              height: 100.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: isSelected
                    ? customColors.primary
                    : customColors.inverseSurface,
                borderRadius: BorderRadius.circular(20.r),
              ),
              alignment: Alignment.center,
              child: SvgPicture.network(
                carBrand.logoUrl ?? '',
                width: 50.w,
                height: 50.h,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? customColors.inverseSurface
                      : customColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
