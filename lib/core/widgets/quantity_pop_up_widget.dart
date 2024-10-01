import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../features/product_details/presentation/logic/product_cubit.dart';
import '../config/text/text_styles.dart';
import '../config/theme/colors_manager.dart';
import '../helpers/extensions/extensions.dart';

class QuantityPopUpWidget extends StatelessWidget {
  const QuantityPopUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildQuantityButton(
          text: "1",
          onTap: () {
            context.read<ProductCubit>().updateProductQuantity(1);
            context.pop();
          },
        ),
        Gap(8.w),
        _buildQuantityButton(
          text: "2",
          onTap: () {
            context.read<ProductCubit>().updateProductQuantity(2);
            context.pop();
          },
        ),
        Gap(8.w),
        _buildQuantityButton(
          text: "3",
          onTap: () {
            context.read<ProductCubit>().updateProductQuantity(3);
            context.pop();
          },
        ),
        Gap(8.w),
        _buildQuantityButton(
          text: "4",
          onTap: () {
            context.read<ProductCubit>().updateProductQuantity(4);
            context.pop();
          },
        ),
      ],
    ).setHorizontalAndVerticalPadding(12.w, 8.h);
  }

  Widget _buildQuantityButton(
      {required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorsManager.whiteBlue,
            width: 1.w,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyles.font14DarkBlueSemiBold,
        ),
      ),
    );
  }
}
