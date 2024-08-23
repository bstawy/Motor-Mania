import 'package:flutter/material.dart';

import '../../../../../core/config/text/text_styles.dart';

class AddressItemInfoWidget extends StatelessWidget {
  final String title;
  final String data;

  const AddressItemInfoWidget({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyles.font10BlueGreyRegular,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            data,
            style: TextStyles.font10DarkBlueMedium,
          ),
        ),
      ],
    );
  }
}
