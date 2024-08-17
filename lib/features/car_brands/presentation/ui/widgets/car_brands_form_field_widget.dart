import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/padding_ext.dart';

class CarBrandsFormFieldWidget extends StatefulWidget {
  final String title;
  final List<dynamic> options;
  final Function(dynamic)? onSelect;

  const CarBrandsFormFieldWidget({
    super.key,
    required this.title,
    required this.options,
    this.onSelect,
  });

  @override
  State<CarBrandsFormFieldWidget> createState() =>
      _CarBrandsFormFieldWidgetState();
}

class _CarBrandsFormFieldWidgetState extends State<CarBrandsFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyles.font14DarkBlueSemiBold,
        ),
        Gap(8.h),
        DropdownButtonFormField(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ColorsManager.darkBlue,
          ),
          hint: Text(
            "Select an option",
            style: TextStyles.font12DarkBlueRegular,
          ),
          style: TextStyles.font12DarkBlueSemiBold,
          items: widget.options
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option.toString()),
                ),
              )
              .toList(),
          onChanged: (value) {
            widget.onSelect!(value);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 13.h,
            ),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
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
      ],
    ).setHorizontalPadding(16.w);
  }
}
