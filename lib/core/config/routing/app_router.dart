import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/addresses/presentation/ui/addresses_screen.dart';
import '../../../features/auth/presentation/logic/login_cubit/login_cubit.dart';
import '../../../features/auth/presentation/logic/register_cubit/register_cubit.dart';
import '../../../features/auth/presentation/ui/login/login_screen.dart';
import '../../../features/auth/presentation/ui/register/register_screen.dart';
import '../../../features/cars/presentation/logic/cars_cubit.dart';
import '../../../features/cars/presentation/ui/car_brands_screen.dart';
import '../../../features/cars/presentation/ui/cars_screen.dart';
import '../../../features/cart/presentation/logic/cart_cubit.dart';
import '../../../features/checkout/presentation/ui/checkout_screen.dart';
import '../../../features/favorites/presentation/logic/favorites_cubit.dart';
import '../../../features/garage/presentation/logic/garage_cubit.dart';
import '../../../features/layout/logic/layout_cubit.dart';
import '../../../features/layout/ui/layout_screen.dart';
import '../../../features/on_boarding/on_boarding_screen.dart';
import '../../../features/orders/presentation/ui/orders_screen.dart';
import '../../../features/payment_methods/presentation/logic/payment_methods_cubit.dart';
import '../../../features/payment_methods/presentation/ui/payments_screen.dart';
import '../../../features/search/presentation/logic/search_cubit.dart';
import '../../../features/search/presentation/search_screen.dart';
import '../../../features/track_order/presentation/ui/track_order_screen.dart';
import '../../di/dependency_injection.dart';
import 'no_route_defined_widget.dart';
import 'routes.dart';

class AppRouter {
  LayoutCubit? _layoutCubit;
  CartCubit? _cartCubit;
  FavoritesCubit? _favoritesCubit;
  GarageCubit? _garageCubit;
  CarsCubit? _carsCubit;

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
        _initializeLayoutCubit();
        _initializeCartCubit();
        _initializeFavoritesCubit();

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _layoutCubit!,
              ),
              BlocProvider<CartCubit>.value(
                value: _cartCubit!,
              ),
              BlocProvider.value(
                value: _favoritesCubit!..getAllFavorites(),
              ),
            ],
            child: const LayoutScreen(),
          ),
          settings: settings,
        );

      case Routes.searchScreen:
        _initializeCartCubit();
        _initializeFavoritesCubit();

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<SearchCubit>(),
              ),
              BlocProvider<LayoutCubit>.value(
                value: _layoutCubit!,
              ),
              BlocProvider<CartCubit>.value(
                value: _cartCubit!,
              ),
              BlocProvider.value(
                value: _favoritesCubit!..getAllFavorites(),
              ),
            ],
            child: const SearchScreen(),
          ),
          settings: settings,
        );

      case Routes.checkout:
        _initializeCartCubit();

        return MaterialPageRoute(
          builder: (_) => BlocProvider<CartCubit>.value(
            value: _cartCubit!,
            child: const CheckoutScreen(),
          ),
          settings: settings,
        );

      case Routes.paymentMethods:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<PaymentMethodsCubit>()..getAllPaymentMethods(),
            child: const PaymentsScreen(),
          ),
          settings: settings,
        );

      case Routes.cars:
        _initializeGarageCubit();
        _initializeCarsCubit();

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<GarageCubit>.value(
                value: _garageCubit!,
              ),
              BlocProvider<CarsCubit>.value(
                value: _carsCubit!..getCarBrands(),
              ),
            ],
            child: const CarsScreen(),
          ),
          settings: settings,
        );

      case Routes.carsBrands:
        _initializeCarsCubit();

        return MaterialPageRoute(
          builder: (_) => BlocProvider<CarsCubit>.value(
            value: _carsCubit!,
            child: const CarBrandsScreen(),
          ),
          settings: settings,
        );

      case Routes.addresses:
        return MaterialPageRoute(
          builder: (_) => const AddressesScreen(),
          settings: settings,
        );

      case Routes.orders:
        return MaterialPageRoute(
          builder: (_) => const OrdersScreen(),
          settings: settings,
        );

      case Routes.trackOrder:
        return MaterialPageRoute(
          builder: (_) => const TrackOrderScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => NoRouteDefinedWidget(settings: settings),
          settings: settings,
        );
    }
  }

  void _initializeLayoutCubit() {
    _layoutCubit ??= LayoutCubit();
  }

  void _initializeCartCubit() {
    _cartCubit ??= getIt<CartCubit>();
  }

  void _initializeFavoritesCubit() {
    _favoritesCubit ??= getIt<FavoritesCubit>();
  }

  void _initializeGarageCubit() {
    _garageCubit ??= getIt<GarageCubit>();
  }

  void _initializeCarsCubit() {
    _carsCubit ??= getIt<CarsCubit>();
  }
}
