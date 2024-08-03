import 'package:flutter/material.dart';

import '../config/text/text_styles.dart';

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
          style: nameStyle ?? TextStyles.font14DarkBlueBold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          type,
          style: typeStyle ?? TextStyles.font10DarkBlueRegular,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
