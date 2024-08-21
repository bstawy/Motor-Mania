import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../garage/presentation/logic/garage_cubit.dart';
import 'car_added_success_sheet_widget.dart';

class AddCarListener extends StatelessWidget {
  const AddCarListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GarageCubit, GarageState>(
      bloc: context.read<GarageCubit>(),
      listenWhen: (previous, current) =>
          current is AddToGarageLoading ||
          current is AddToGarageSuccess ||
          current is AddToGarageError,
      listener: (context, state) {
        switch (state) {
          case AddToGarageLoading():
            context.loadingSnackBar("Adding Car...");
            break;
          case AddToGarageSuccess():
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            showModalBottomSheet(
              context: context,
              builder: (context) => const CarAddedSuccessSheet(),
              isScrollControlled: true,
              useSafeArea: true,
              backgroundColor: Colors.white,
            );
            break;
          case AddToGarageError():
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
