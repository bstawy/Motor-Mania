import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/entities/car_brand_entity.dart';
import '../logic/cars_cubit.dart';
import 'widgets/car_brand_item_widget.dart';

class CarBrandsScreen extends StatelessWidget {
  const CarBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Choose Car Brand',
      ),
      body: BlocBuilder<CarsCubit, CarsState>(
        bloc: context.read<CarsCubit>(),
        builder: (context, state) {
          final List<CarBrandEntity> carBrands =
              context.read<CarsCubit>().carBrands;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 8.w,
              mainAxisExtent: 100.h,
            ),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            itemCount: carBrands.length,
            itemBuilder: (context, index) {
              return CarBrandItemWidget(carBrand: carBrands[index]);
            },
          );
        },
      ),
    );
  }
}
