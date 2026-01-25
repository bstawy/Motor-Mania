import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motor_mania/features/product_details/presentation/logic/product_cubit.dart';

import '../../features/layout/logic/layout_cubit.dart';
import '../../features/product_details/domain/entities/product_entity.dart';
import '../../features/product_details/presentation/ui/product_details_screen.dart';
import '../../main.dart';
import 'extensions/theme_ext.dart';

void openProductBottomSheet({
  required BuildContext context,
  required ProductEntity product,
}) {
  context.read<LayoutCubit>().openBottomSheet();

  final Completer<void> completer = Completer<void>();

  showModalBottomSheet(
    context: context,
    builder: (ctx) {
      context.read<LayoutCubit>().productDetailsBottomSheetContext = ctx;
      return BlocProvider(
        create: (context) => ProductCubit()..product = product,
        child: ProductDetailsScreen(product: product),
      );
    },
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: navigatorKey.currentContext!.colors.surface,
  ).whenComplete(
    () {
      completer.complete();
      if (context.mounted) {
        final layoutCubit = context.read<LayoutCubit>();
        if (layoutCubit.isProductDetailsBottomSheetOpen) {
          layoutCubit.closeBottomSheet();
        }
      }
    },
  );
}
