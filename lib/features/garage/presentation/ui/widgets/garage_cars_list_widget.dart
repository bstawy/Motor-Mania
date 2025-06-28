import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../home/domain/entities/car_entity.dart';
import '../../logic/garage_cubit.dart';
import 'garage_item_widget.dart';
import 'remove_car_listener.dart';
import 'selected_car_listener.dart';

class GarageCarsListWidget extends StatelessWidget {
  final List<CarEntity> garageCars;

  const GarageCarsListWidget({super.key, required this.garageCars});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GarageCubit>().getGarageCars();
      },
      child: Column(
        children: [
          const SelectedCarListener(),
          const RemoveCarListener(),
          Expanded(
            child: ListView.builder(
              itemCount: garageCars.length,
              itemBuilder: (context, index) {
                return GarageItemWidget(
                  car: garageCars[index],
                ).setOnlyPadding(0, 4.h, 0, 0);
              },
            ).setOnlyPadding(12.h, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}
