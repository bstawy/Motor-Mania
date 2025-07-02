import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../../core/widgets/custom_network_image_widget.dart';
import '../../../../../core/widgets/product_name_and_type_widget.dart';
import '../../../../../core/widgets/product_price_widget.dart';
import '../../../../cart/domain/entities/cart_product_entity.dart';
import '../../../../cart/presentation/logic/cart_cubit.dart';

class CheckoutItemWidget extends StatelessWidget {
  final CartProductEntity cartProduct;
  final bool? isFirst;
  final bool? isLast;

  const CheckoutItemWidget({
    super.key,
    required this.cartProduct,
    this.isFirst,
    this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    BorderRadius? radius;
    if (context.read<CartCubit>().cartProducts.length > 1) {
      if (isFirst!) {
        radius = BorderRadius.only(
          topLeft: Radius.circular(15.r),
          bottomLeft: Radius.circular(15.r),
        );
      } else if (isLast!) {
        radius = BorderRadius.only(
          topRight: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        );
      } else {
        radius = BorderRadius.zero;
      }
    } else {
      radius = BorderRadius.circular(15.r);
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: customColors.inverseSurface,
        borderRadius: radius,
      ),
      child: Row(
        children: [
          isFirst!
              ? const SizedBox()
              : Container(
                  margin: EdgeInsets.only(right: 16.w),
                  width: 1.5.w,
                  height: double.infinity,
                  color: ColorsManager.blueGrey,
                ),
          CustomNetworkImage(
            url: ApiConstants.localHostImagesUrl +
                (cartProduct.product.imageUrl ?? ""),
            imageHeight: 70.h,
            imageWidth: 70.w,
          ),
          Gap(12.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductNameAndTypeWidget(
                name: cartProduct.product.name ?? "",
                type: cartProduct.product.compatibleCars?.first.brand ?? "",
                nameStyle: customTextStyles.headlineSmall?.copyWith(
                  fontWeight: FontWeightHelper.semiBold,
                ),
                typeStyle: customTextStyles.labelMedium?.copyWith(
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
              Gap(4.h),
              ProductPriceWidget(
                finalPrice: cartProduct.product.price ?? 0,
                finalPriceStyle: customTextStyles.headlineSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Get It ',
                      style: TextStyles.font10DarkBlueBold,
                      children: [
                        TextSpan(
                          text: 'by ',
                          style: TextStyles.font10DarkBlueMedium,
                        ),
                        TextSpan(
                          text: 'Fri, 12 July',
                          style: TextStyles.font10RedBold,
                        ),
                      ],
                    ),
                  ),
*/