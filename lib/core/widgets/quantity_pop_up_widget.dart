import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../main.dart';
import '../config/theme/texts/font_weight_helper.dart';
import '../helpers/extensions/extensions.dart';
import '../helpers/extensions/theme_ext.dart';

class QuantityPopUpWidget extends StatelessWidget {
  const QuantityPopUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildQuantityButton(
          text: "1",
          onTap: () {
            // TODO: Implement update product quantity
            // context.read<ProductCubit>().updateProductQuantity(1);
            context.pop();
          },
        ),
        Gap(8.w),
        _buildQuantityButton(
          text: "2",
          onTap: () {
            // context.read<ProductCubit>().updateProductQuantity(2);
            context.pop();
          },
        ),
        Gap(8.w),
        _buildQuantityButton(
          text: "3",
          onTap: () {
            // context.read<ProductCubit>().updateProductQuantity(3);
            context.pop();
          },
        ),
        Gap(8.w),
        _buildQuantityButton(
          text: "4",
          onTap: () {
            // context.read<ProductCubit>().updateProductQuantity(4);
            context.pop();
          },
        ),
      ],
    ).setHorizontalAndVerticalPadding(12.w, 8.h);
  }

  Widget _buildQuantityButton(
      {required String text, required Function() onTap}) {
    final customTextStyles = navigatorKey.currentState!.context.textStyles;
    final customColors = navigatorKey.currentState!.context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: customColors.inverseSurface,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: customColors.primary,
            width: 1.w,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: customTextStyles.headlineMedium?.copyWith(
            color: customColors.primary,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
      ),
    );
  }
}
