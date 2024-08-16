import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../logic/cart_cubit.dart';

class CouponFieldWidget extends StatefulWidget {
  const CouponFieldWidget({super.key});

  @override
  State<CouponFieldWidget> createState() => _CouponFieldWidgetState();
}

class _CouponFieldWidgetState extends State<CouponFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 300.h,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(
            color: ColorsManager.blueGrey,
            width: 1.w,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 12.h,
        ),
        hintText: "Enter Coupon Code",
        hintStyle: TextStyles.font12BlueGreyLight,
        suffix: BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) =>
              current is CouponApplied ||
              current is CouponRemoved ||
              current is CouponError,
          builder: (context, state) {
            if (state is CouponApplied) {
              return InkWell(
                onTap: () {
                  _controller.clear();
                  context.read<CartCubit>().removeCoupon();
                },
                child: Text(
                  "Remove",
                  style: TextStyles.font12RedSemiBold,
                ),
              );
            } else {
              return InkWell(
                onTap: () {
                  if (_controller.text.isNotEmpty) {
                    context.read<CartCubit>().applyCoupon(_controller.text);
                  }
                },
                child: Text(
                  "Apply",
                  style: TextStyles.font12DarkBlueSemiBold,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
