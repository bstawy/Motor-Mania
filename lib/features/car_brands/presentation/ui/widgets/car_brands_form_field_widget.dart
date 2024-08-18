import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/extensions.dart';

class CarBrandsFormFieldWidget extends StatefulWidget {
  final String title;
  final List<dynamic> options;
  final Function(dynamic)? onSelect;
  final bool? isEnabled;

  const CarBrandsFormFieldWidget({
    super.key,
    required this.title,
    required this.options,
    this.onSelect,
    this.isEnabled = true,
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
        GestureDetector(
          onTap: () => widget.isEnabled!
              ? null
              : context.errorSnackBar("Select a car model first"),
          child: DropdownButtonFormField(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: ColorsManager.darkBlue,
            ),
            hint: Text(
              "Select an option",
              style: TextStyles.font12DarkBlueRegular,
            ),
            style: TextStyles.font12DarkBlueSemiBold,
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
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 13.h,
              ),
              isDense: true,
              enabled: widget.isEnabled!,
              filled: true,
              fillColor: widget.isEnabled!
                  ? Colors.white
                  : ColorsManager.darkBlue.withOpacity(0.3),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(
                  color: ColorsManager.darkBlue.withOpacity(0.3),
                  width: 0.0,
                ),
              ),
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
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
