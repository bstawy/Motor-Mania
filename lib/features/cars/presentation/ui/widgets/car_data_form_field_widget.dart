import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/extensions/theme_ext.dart';

class CarDataFormFieldWidget extends StatefulWidget {
  final String title;
  final List<dynamic> options;
  final Function(dynamic)? onSelect;
  final bool? isEnabled;

  const CarDataFormFieldWidget({
    super.key,
    required this.title,
    required this.options,
    this.onSelect,
    this.isEnabled = true,
  });

  @override
  State<CarDataFormFieldWidget> createState() => _CarDataFormFieldWidgetState();
}

class _CarDataFormFieldWidgetState extends State<CarDataFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final customTextStyles = context.textStyles;
    final customColors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: customTextStyles.headlineMedium?.copyWith(
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        Gap(8.h),
        GestureDetector(
          onTap: () => widget.isEnabled!
              ? null
              : context.errorSnackBar("Select a car model first"),
          child: DropdownButtonFormField(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: customColors.primary,
            ),
            hint: Text(
              "Select an option",
              style: customTextStyles.headlineSmall?.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            style: customTextStyles.headlineSmall?.copyWith(
              fontWeight: FontWeightHelper.semiBold,
            ),
            items: widget.isEnabled!
                ? widget.options
                    .map(
                      (option) => DropdownMenuItem(
                        value: option,
                        child: Text(option.toString()),
                      ),
                    )
                    .toList()
                : null,
            onChanged: (value) {
              widget.onSelect!(value);
            },
            dropdownColor: customColors.inversePrimary,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 13.h,
              ),
              isDense: true,
              enabled: widget.isEnabled!,
              filled: true,
              fillColor: widget.isEnabled!
                  ? customColors.inverseSurface
                  : customColors.surface,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: const BorderSide(width: 0.0),
              ),
              border: OutlineInputBorder(
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
            ),
          ),
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
