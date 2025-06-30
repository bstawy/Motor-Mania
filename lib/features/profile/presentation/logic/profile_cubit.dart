import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_manager/app_manager_cubit.dart';
import '../../../../core/config/routing/routes.dart';
import '../../../../core/helpers/assets_manager.dart';
import '../../../../core/helpers/enums/app_modes_enums.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/helpers/extensions/theme_ext.dart';
import '../../../../main.dart';
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
      leadingIconPath: AssetsManager.profileOrdersIcon,
      leadingDarkIconPath: AssetsManager.profileOrdersDarkIcon,
      onTap: (context) {
        context.pushNamed(Routes.orders);
      },
    ),
    OptionModel(
      id: 2,
      title: "Returns",
      subtitle: "0 Active Requests",
      leadingIconPath: AssetsManager.profileLowReturnRateIcon,
      leadingDarkIconPath: AssetsManager.profileLowReturnRateDarkIcon,
    ),
    OptionModel(
      id: 3,
      title: "Wallet",
      subtitle: "\$192.85",
      leadingIconPath: AssetsManager.profileWalletIcon,
      leadingDarkIconPath: AssetsManager.profileWalletDarkIcon,
    ),
    OptionModel(
      id: 4,
      title: "Sell With Us",
      subtitle: "Join Now!",
      leadingIconPath: AssetsManager.profileSellerIcon,
      leadingDarkIconPath: AssetsManager.profileSellerDarkIcon,
    ),
  ];

  final List<OptionModel> accountOptions = [
    OptionModel(
      id: 5,
      title: "Addresses",
      leadingIconPath: AssetsManager.profileAddressesIcon,
      leadingDarkIconPath: AssetsManager.profileAddressesDarkIcon,
      onTap: (context) {
        context.pushNamed(Routes.addresses);
      },
    ),
    OptionModel(
      id: 6,
      title: "Payment",
      leadingIconPath: AssetsManager.profileCardIcon,
      leadingDarkIconPath: AssetsManager.profileCardDarkIcon,
      onTap: (context) {
        context.pushNamed(Routes.paymentMethods);
      },
    ),
    OptionModel(
      id: 7,
      title: "warranty Claims",
      leadingIconPath: AssetsManager.profileWarrantyIcon,
      leadingDarkIconPath: AssetsManager.profileWarrantyDarkIcon,
    ),
    OptionModel(
      id: 8,
      title: "QR Code",
      leadingIconPath: AssetsManager.profileQrCodeIcon,
      leadingDarkIconPath: AssetsManager.profileQrCodeDarkIcon,
    ),
  ];

  final List<OptionModel> settingsOptions = [
    OptionModel(
      id: 9,
      title: "Theme Mode",
      leadingIconPath: AssetsManager.profileDarkModeIcon,
      leadingDarkIconPath: AssetsManager.profileDarkModeDarkIcon,
      onTap: (context) {
        showModalBottomSheet(
          context: context,
          builder: (context) => const ChangeThemeBottomSheet(),
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: navigatorKey.currentContext!.colors.inverseSurface,
        );
      },
    ),
    OptionModel(
      id: 10,
      title: "Security",
      leadingIconPath: AssetsManager.profileSecurityIcon,
      leadingDarkIconPath: AssetsManager.profileSecurityDarkIcon,
    ),
    OptionModel(
      id: 11,
      title: "Notification",
      leadingIconPath: AssetsManager.profileNotificationsIcon,
      leadingDarkIconPath: AssetsManager.profileNotificationsDarkIcon,
    ),
    navigatorKey.currentContext!.read<AppManagerCubit>().appMode ==
            AppMode.guest
        ? OptionModel(
            id: 13,
            title: "Become a Partner",
            leadingIconPath: AssetsManager.partnerIcon,
            leadingDarkIconPath: AssetsManager.partnerDarkIcon,
            onTap: (context) {
              // context.pushNamed(Routes.becomePartner);
            },
          )
        : OptionModel(
            id: 12,
            title: "Logout",
            leadingIconPath: AssetsManager.profileLogoutIcon,
            leadingDarkIconPath: AssetsManager.profileLogoutDarkIcon,
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
