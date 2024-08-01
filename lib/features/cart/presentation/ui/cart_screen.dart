import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/text/text_styles.dart';
import '../logic/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: context.read<CartCubit>()..getCartProducts(),
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text(
              "Cart",
              style: TextStyles.font20DarkBlueBold,
            ),
          ),
        );
      },
    );
  }
}
