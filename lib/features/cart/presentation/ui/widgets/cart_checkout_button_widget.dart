import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/navigation_ext.dart';
import '../../../../../core/helpers/save_navigation_data.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../logic/cart_cubit.dart';

class CartCheckoutButtonWidget extends StatelessWidget {
  final int quantity;

  const CartCheckoutButtonWidget({
    super.key,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 4.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.darkBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: BlocBuilder<AppManagerCubit, AppManagerState>(
        bloc: context.read<AppManagerCubit>(),
        buildWhen: (previous, current) {
          return current is UserLoggedInState || current is NoUserLoggedInState;
        },
        builder: (context, state) {
          if (state is UserLoggedInState) {
            return _buildCheckoutButton(
              context,
              () {
                context.pushNamed(Routes.checkout);
              },
              "CHECKOUT",
            );
          } else {
            return _buildCheckoutButton(
              context,
              () {
                saveNavigationData(
                  Routes.layoutScreen,
                  3,
                );
                context.pushNamed(Routes.loginScreen);
              },
              "LOGIN TO CHECKOUT",
            );
          }
        },
      ),
    );
  }

  Widget _buildCheckoutButton(
      BuildContext context, Function() action, String? actionText) {
    return CustomMaterialButton(
      onClicked: action,
      height: 40.h,
      backgroundColor: ColorsManager.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<CartCubit, CartState>(
            bloc: context.read<CartCubit>(),
            buildWhen: (previous, current) {
              return (current is CartLoaded ||
                  current is CouponApplied ||
                  current is CouponRemoved);
            },
            builder: (context, state) {
              return RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: '$quantity items\n',
                  style: TextStyles.font8WhiteRegular,
                  children: [
                    TextSpan(
                      text:
                          '\$${context.read<CartCubit>().subTotal.toStringAsFixed(2)}',
                      style: TextStyles.font12WhiteSemiBold,
                    ),
                  ],
                ),
              );
            },
          ),
          Text(
            actionText ?? "",
            style: TextStyles.font12WhiteSemiBold,
          ),
          SvgPicture.asset("assets/icons/checkout_icon.svg"),
        ],
      ),
    );
  }
}
