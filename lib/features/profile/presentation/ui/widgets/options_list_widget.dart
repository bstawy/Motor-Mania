import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../models/option_model.dart';

class OptionsListWidget extends StatelessWidget {
  final String title;
  final List<OptionModel> options;

  const OptionsListWidget({
    super.key,
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font14DarkBlueMedium,
        ),
        Gap(8.h),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: ColorsManager.whiteBlue,
                  indent: 16.w,
                  endIndent: 16.w,
                );
              },
              itemCount: options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    debugPrint("Option ${options[index].title} tapped");
                    if (options[index].onTap != null) {
                      options[index].onTap!(context);
                    }
                  },
                  child: ListTile(
                    leading: SvgPicture.asset(options[index].leadingIconPath!),
                    title: Text(
                      options[index].title!,
                      style: TextStyles.font12DarkBlueMedium,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.r,
                      color: ColorsManager.blueGrey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
