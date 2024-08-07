import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/login/logic/login_cubit.dart';
import '../../../features/auth/login/presentation/login_screen.dart';
import '../../../features/auth/register/logic/register_cubit.dart';
import '../../../features/auth/register/presentation/register_screen.dart';
import '../../../features/cart/presentation/logic/cart_cubit.dart';
import '../../../features/favorites/presentation/logic/favorites_cubit.dart';
import '../../../features/layout/logic/layout_cubit.dart';
import '../../../features/layout/presentation/layout_screen.dart';
import '../../../features/on_boarding/on_boarding_screen.dart';
import '../../../features/search/presentation/logic/search_cubit.dart';
import '../../../features/search/presentation/search_screen.dart';
import '../../di/dependency_injection.dart';
import 'no_route_defined_widget.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreens:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
          settings: settings,
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterCubit>(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
          settings: settings,
        );

      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<LayoutCubit>()),
              BlocProvider(
                create: (context) => getIt<FavoritesCubit>()..getAllFavorites(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>()..getCartProducts(),
              ),
            ],
            child: const LayoutScreen(),
          ),
          settings: settings,
        );

      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<SearchCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<FavoritesCubit>()..getAllFavorites(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>()..getCartProducts(),
              ),
            ],
            child: const SearchScreen(),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => NoRouteDefinedWidget(settings: settings),
          settings: settings,
        );
    }
  }
}
