import '../caching/navigation_data_manager.dart';

void saveNavigationData(String routeName, Object? arguments) {
  final ScreenNavigationData navData = ScreenNavigationData(
    previousScreenRouteName: routeName,
    previousScreenArguments: arguments,
  );
  NavigationDataManager.saveScreenNavigationData(navData);
}
