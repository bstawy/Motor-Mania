import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../logic/car_brands_cubit.dart';
import 'car_added_success_sheet_widget.dart';

class AddCarListener extends StatelessWidget {
  const AddCarListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CarBrandsCubit, CarBrandsState>(
      bloc: context.read<CarBrandsCubit>(),
      listenWhen: (previous, current) =>
          current is CarBrandsAdding ||
          current is CarBrandsAddedSuccess ||
          current is CarBrandsAddedError,
      listener: (context, state) {
        switch (state) {
          case CarBrandsAdding():
            context.loadingSnackBar("Adding Car...");
            break;
          case CarBrandsAddedSuccess():
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showModalBottomSheet(
              context: context,
              builder: (context) => const CarAddedSuccessSheet(),
              isScrollControlled: true,
              useSafeArea: true,
              backgroundColor: Colors.white,
            );
            break;
          case CarBrandsAddedError():
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            context.errorSnackBar(state.failure.message ?? "Error adding car");
            break;
          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
