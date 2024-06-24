import 'package:flutter/material.dart';

import '../../../features/auth/login/login_screen.dart';
import '../../../features/on_boarding/on_boarding_screens.dart';
import 'no_route_defined_widget.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreens:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreens());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => NoRouteDefinedWidget(settings: settings),
        );
    }
  }
}
