import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../core/config/routing/routes.dart';
import '../../../../core/helpers/enums/app_modes_enums.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../models/option_model.dart';
import '../ui/widgets/change_theme_bottom_sheet.dart';
import '../ui/widgets/logout_alert_dialog_widget.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final List<OptionModel> primaryOptions = [
    OptionModel(
      id: 1,
      title: "Orders",
      subtitle: "Manage & Track",
      leadingIconPath: "assets/icons/profile_orders_icon.svg",
      onTap: (context) {
        context.pushNamed(Routes.orders);
      },
    ),
    OptionModel(
      id: 2,
      title: "Returns",
      subtitle: "0 Active Requests",
      leadingIconPath: "assets/icons/low_return_rate_icon.svg",
    ),
    OptionModel(
      id: 3,
      title: "Wallet",
      subtitle: "\$192.85",
      leadingIconPath: "assets/icons/wallet_icon.svg",
    ),
    OptionModel(
      id: 4,
      title: "Sell With Us",
      subtitle: "Join Now!",
      leadingIconPath: "assets/icons/profile_seller_icon.svg",
    ),
  ];

  final List<OptionModel> accountOptions = [
    OptionModel(
      id: 5,
      title: "Addresses",
      leadingIconPath: "assets/icons/profile_location_icon.svg",
      onTap: (context) {
        context.pushNamed(Routes.addresses);
      },
    ),
    OptionModel(
      id: 6,
      title: "Payment",
      leadingIconPath: "assets/icons/card_icon.svg",
      onTap: (context) {
        context.pushNamed(Routes.paymentMethods);
      },
    ),
    OptionModel(
      id: 7,
      title: "warranty Claims",
      leadingIconPath: "assets/icons/profile_warranty_icon.svg",
    ),
    OptionModel(
      id: 8,
      title: "QR Code",
      leadingIconPath: "assets/icons/profile_qr_code_icon.svg",
    ),
  ];

  final List<OptionModel> settingsOptions = [
    OptionModel(
      id: 9,
      title: "Theme Mode",
      leadingIconPath: "assets/icons/profile_dark_mode_icon.svg",
      onTap: (context) {
        showModalBottomSheet(
          context: context,
          builder: (context) => const ChangeThemeBottomSheet(),
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: Colors.white,
        );
      },
    ),
    OptionModel(
      id: 10,
      title: "Security",
      leadingIconPath: "assets/icons/profile_security_icon.svg",
    ),
    OptionModel(
      id: 11,
      title: "Notification",
      leadingIconPath: "assets/icons/profile_notification_icon.svg",
    ),
    OptionModel(
      id: 12,
      title: "Logout",
      leadingIconPath: "assets/icons/profile_logout_icon.svg",
      onTap: (context) async {
        if (context.read<AppManagerCubit>().appMode == AppMode.user) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const LogoutAlertDialogWidget();
            },
          );
        } else {
          context.errorSnackBar("You are not logged in");
        }
      },
    ),
  ];

  ProfileCubit() : super(ProfileInitial());
}
