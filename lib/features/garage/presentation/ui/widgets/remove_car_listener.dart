import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../logic/garage_cubit.dart';

class RemoveCarListener extends StatelessWidget {
  const RemoveCarListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GarageCubit, GarageState>(
      bloc: context.read<GarageCubit>(),
      listenWhen: (previous, current) =>
          current is RemoveFromGarageLoading ||
          current is RemoveFromGarageSuccess ||
          current is RemoveFromGarageError,
      listener: (context, state) {
        switch (state) {
          case RemoveFromGarageLoading():
            context.loadingSnackBar("Removing Car...");
            break;
          case RemoveFromGarageSuccess():
            context.successSnackBar("Car removed successfully");
            context.read<GarageCubit>().getGarageCars();
            break;
          case RemoveFromGarageError():
            context.errorSnackBar(state.error.message ?? "Error removing car");
            break;
          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
