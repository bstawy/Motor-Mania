import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cars/presentation/logic/cars_cubit.dart';
import '../../logic/garage_cubit.dart';

class SelectedCarListener extends StatelessWidget {
  const SelectedCarListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CarsCubit, CarsState>(
      bloc: context.read<CarsCubit>(),
      listenWhen: (previous, current) => current is CarDataCompleted,
      listener: (context, state) {
        if (state is CarDataCompleted) {
          context.read<GarageCubit>().addCar(state.carData);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
