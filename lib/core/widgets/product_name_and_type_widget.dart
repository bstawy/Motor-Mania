import 'package:flutter/material.dart';

import '../../main.dart';
import '../config/text/text_styles.dart';
import '../config/theme/colors_manager.dart';

class ProductNameAndTypeWidget extends StatelessWidget {
  final String name, type;
  final TextStyle? nameStyle, typeStyle;

  const ProductNameAndTypeWidget({
    super.key,
    required this.name,
    required this.type,
    this.nameStyle,
    this.typeStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: nameStyle ??
              TextStyles.font14DarkBlueBold.copyWith(
                color: themeIsDark ? Colors.white : ColorsManager.darkBlue,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          type,
          style: typeStyle ??
              TextStyles.font10DarkBlueRegular.copyWith(
                color: themeIsDark ? Colors.white : ColorsManager.darkBlue,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
