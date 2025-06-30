import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cart/presentation/logic/cart_cubit.dart';
import '../../features/favorites/presentation/logic/favorites_cubit.dart';
import '../../features/layout/logic/layout_cubit.dart';
import '../../features/product_details/presentation/logic/product_cubit.dart';
import '../../features/product_details/presentation/ui/product_details_screen.dart';
import '../../main.dart';
import '../di/dependency_injection.dart';
import 'extensions/theme_ext.dart';

void openProductBottomSheet({
  required BuildContext context,
  required int productId,
}) {
  context.read<LayoutCubit>().openBottomSheet();
  final Completer<void> completer = Completer<void>();

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<ProductCubit>(),
            // ..getProductDetails(productId),
          ),
          BlocProvider(
            create: (context) => getIt<CartCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<FavoritesCubit>()..getAllFavorites(),
          ),
        ],
        child: const ProductDetailsScreen(),
      );
    },
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: navigatorKey.currentContext!.colors.surface,
  ).whenComplete(
    () {
      completer.complete();
      if (context.mounted) {
        context.read<LayoutCubit>().closeBottomSheet();
      }
    },
  );
}
