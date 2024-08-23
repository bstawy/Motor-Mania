import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/text/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_material_button.dart';
import 'widgets/address_item_widget.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Addresses'),
      body: ListView.separated(
        itemCount: 2,
        separatorBuilder: (context, index) => Gap(8.h),
        itemBuilder: (context, index) => AddressItemWidget(
          isDefault: index == 0,
        ),
      ).setOnlyPadding(16.h, 0, 16.w, 16.w),
      bottomNavigationBar: CustomMaterialButton(
        onClicked: () {
          // TODO: add new address
        },
        title: "Add New Address",
        backgroundColor: Colors.white,
        borderColor: ColorsManager.red,
        titleStyle: TextStyles.font14RedSemiBold,
      ).setHorizontalAndVerticalPadding(16.w, 16.h),
    );
  }
}
