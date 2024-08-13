import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName,
      {Object? arguments, bool navigateWithNavBar = false}) {
    return Navigator.of(this, rootNavigator: !navigateWithNavBar)
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName,
      {Object? arguments, bool navigateWithNavBar = false}) {
    return Navigator.of(this, rootNavigator: !navigateWithNavBar)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments,
      required RoutePredicate predicate,
      bool navigateWithNavBar = false}) {
    return Navigator.of(this, rootNavigator: !navigateWithNavBar)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this, rootNavigator: true).pop();

  void popUntil(String routeName, {bool navigateWithNavBar = false}) =>
      Navigator.of(this, rootNavigator: !navigateWithNavBar)
          .popUntil(ModalRoute.withName(routeName));
}
