import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import 'garage_item_widget.dart';

class GarageCarsListWidget extends StatelessWidget {
  const GarageCarsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const GarageItemWidget().setOnlyPadding(0, 8.h, 0, 0);
      },
    ).setOnlyPadding(12.h, 0, 0, 0);
  }
}
