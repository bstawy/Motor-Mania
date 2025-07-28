import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notification_center/notification_center.dart';

import '../../../../../core/helpers/extensions/padding_ext.dart';
import '../../../../home/domain/entities/car_entity.dart';
import '../../logic/garage_cubit.dart';
import 'garage_item_widget.dart';
import 'remove_car_listener.dart';
import 'selected_car_listener.dart';

class GarageCarsListWidget extends StatefulWidget {
  final List<CarEntity> garageCars;

  const GarageCarsListWidget({super.key, required this.garageCars});

  @override
  State<GarageCarsListWidget> createState() => _GarageCarsListWidgetState();
}

class _GarageCarsListWidgetState extends State<GarageCarsListWidget> {
  @override
  void initState() {
    super.initState();
    NotificationCenter().subscribe('new_vehicle_added', (data) {
      context.read<GarageCubit>().getGarageCars();
    });
    NotificationCenter().subscribe('default_vehicle_switched', (data) {
      context.read<GarageCubit>().changeDefaultCar(data as CarEntity);
    });
  }

  @override
  void dispose() {
    NotificationCenter().unsubscribe('new_vehicle_added');
    NotificationCenter().unsubscribe('default_vehicle_switched');
    super.dispose();
  }

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
              itemCount: widget.garageCars.length,
              itemBuilder: (context, index) {
                return GarageItemWidget(
                  car: widget.garageCars[index],
                ).setOnlyPadding(0, 4.h, 0, 0);
              },
            ).setOnlyPadding(12.h, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}
