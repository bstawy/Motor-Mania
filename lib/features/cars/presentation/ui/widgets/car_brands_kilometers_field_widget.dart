import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';
import '../../logic/cars_cubit.dart';

class CarBrandsKilometersFieldWidget extends StatefulWidget {
  final bool? isEnabled;
  const CarBrandsKilometersFieldWidget({
    super.key,
    this.isEnabled = true,
  });

  @override
  State<CarBrandsKilometersFieldWidget> createState() =>
      _CarBrandsKilometersFieldWidgetState();
}

class _CarBrandsKilometersFieldWidgetState
    extends State<CarBrandsKilometersFieldWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Current Kilometers",
          style: customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        Gap(8.h),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => widget.isEnabled!
                    ? null
                    : context.errorSnackBar("Select a car year first"),
                child: TextField(
                  controller: _controller,
                  style: customTextStyles.headlineSmall?.copyWith(
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                  keyboardType: TextInputType.number,
                  enabled: context.read<CarsCubit>().selectedCarYear != null,
                  onTapOutside: (event) {
                    if (_controller.value.text.isNotEmpty) {
                      context
                          .read<CarsCubit>()
                          .selectCarKilometers(_controller.value.text);
                    }
                    return FocusScope.of(context).unfocus();
                  },
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      context
                          .read<CarsCubit>()
                          .selectCarKilometers(_controller.value.text);
                      return;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 13.h,
                    ),
                    isDense: true,
                    filled: true,
                    fillColor: widget.isEnabled!
                        ? customColors.inverseSurface
                        : customColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: const BorderSide(width: 0.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: const BorderSide(width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: const BorderSide(width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(
                        color: ColorsManager.blueGrey,
                        width: 1.5.r,
                      ),
                    ),
                    hintText: "Enter Kilometers",
                    hintStyle: customTextStyles.headlineSmall?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
