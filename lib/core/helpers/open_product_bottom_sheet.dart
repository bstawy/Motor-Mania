import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/product_details/presentation/logic/product_cubit.dart';
import '../../features/product_details/presentation/ui/product_details_screen.dart';
import '../config/app_manager/app_manager_cubit.dart';
import '../di/dependency_injection.dart';

void openProductBottomSheet({
  required BuildContext context,
  required String productId,
}) {
  context.read<AppManagerCubit>().openBottomSheet();
  final Completer<void> completer = Completer<void>();

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context) => getIt<ProductCubit>()
          ..getProductDetails(productId)
          ..getSimilarProducts(),
        child: const ProductDetailsScreen(),
      );
    },
    isScrollControlled: true,
    useSafeArea: true,
  ).whenComplete(
    () {
      completer.complete();
      context.read<AppManagerCubit>().closeBottomSheet();
    },
  );
}
