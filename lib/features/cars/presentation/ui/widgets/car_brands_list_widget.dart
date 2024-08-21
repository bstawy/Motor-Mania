import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/text/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../domain/entities/car_brand_entity.dart';
import 'car_brand_item_widget.dart';

class CarBrandsListWidget extends StatelessWidget {
  final List<CarBrandEntity> carBrands;

  const CarBrandsListWidget({
    super.key,
    required this.carBrands,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose Car Brand",
              style: TextStyles.font14DarkBlueSemiBold,
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.carsBrands);
              },
              child: Text(
                "See All",
                style: TextStyles.font10RedRegular,
              ),
            ),
          ],
        ).setHorizontalPadding(16.w),
        Gap(8.h),
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: carBrands.length,
            itemBuilder: (context, index) {
              return CarBrandItemWidget(carBrand: carBrands[index])
                  .setOnlyPadding(0, 0, 8.w, 0);
            },
          ),
        ),
      ],
    );
  }
}
