import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/empty_screen_widget.dart';
import '../../../../home/presentation/logic/home_cubit/home_cubit.dart';
import '../../../../home/presentation/ui/widgets/home_list_widget.dart';

class CartEmptyWidget extends StatelessWidget {
  const CartEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const EmptyScreenWidget(
            imagePath: "assets/images/cart_empty_image.png",
            firstTextSpan: "Your Shopping Cart Looks ",
            secondTextSpan: "Empty!",
            description:
                "What are you waiting for? Start adding items to your cart now",
          ),
          Gap(32.h),
          BlocProvider<HomeCubit>(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeListWidget(title: "Recommended For You"),
          ),
        ],
      ),
    );
  }
}
