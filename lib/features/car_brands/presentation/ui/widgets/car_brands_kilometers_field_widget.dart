import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/helpers/extensions/padding_ext.dart';
import '../../cubit/car_brands_cubit.dart';

class CarBrandsKilometersFieldWidget extends StatefulWidget {
  const CarBrandsKilometersFieldWidget({super.key});

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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Current Kilometers",
          style: TextStyles.font14DarkBlueSemiBold,
        ),
        Gap(8.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                style: TextStyles.font12DarkBlueSemiBold,
                onTapOutside: (event) {
                  if (_controller.value.text.isNotEmpty) {
                    context
                        .read<CarBrandsCubit>()
                        .selectCarKilometers(_controller.value.text);
                  }
                  return FocusScope.of(context).unfocus();
                },
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context
                        .read<CarBrandsCubit>()
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
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide(
                      color: ColorsManager.blueGrey,
                      width: 1.5.r,
                    ),
                  ),
                  hintText: "Enter Kilometers",
                  hintStyle: TextStyles.font12DarkBlueRegular,
                ),
              ),
            ),
          ],
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
