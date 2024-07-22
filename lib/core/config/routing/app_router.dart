import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/login/logic/login_cubit.dart';
import '../../../features/auth/login/presentation/login_screen.dart';
import '../../../features/auth/register/logic/register_cubit.dart';
import '../../../features/auth/register/presentation/register_screen.dart';
import '../../../features/favorites/presentation/logic/favorites_cubit.dart';
import '../../../features/layout/layout_screen.dart';
import '../../../features/on_boarding/on_boarding_screen.dart';
import '../../../features/search/presentation/search_screen.dart';
import '../../di/dependency_injection.dart';
import 'no_route_defined_widget.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreens:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterCubit>(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<FavoritesCubit>()..getAllFavorites(),
              ),
              // TODO: add cart cubit
            ],
            child: const LayoutScreen(),
          ),
        );

      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => NoRouteDefinedWidget(settings: settings),
        );
    }
  }
}
