import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../config/constants/caching_constants.dart';
import 'secure_storage_factory.dart';

class NavigationDataManager {
  static saveScreenNavigationData(ScreenNavigationData data) async {
    final jsonString = jsonEncode(data.toJson());
    // Print data
    if (kDebugMode) {
      debugPrint('Screen navigation data saved with >>>>>> $jsonString');
    }
    await SecureStorageFactory.write(
      key: CachingConstants.screenNavigationData,
      value: jsonString,
    );
  }

  static getScreenNavigationData() async {
    final jsonString =
        await SecureStorageFactory.read(CachingConstants.screenNavigationData);
    if (jsonString == null) {
      return null;
    }
    // json data
    if (kDebugMode) {
      debugPrint('Screen navigation data saved with >>>>>> $jsonString');
    }
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return ScreenNavigationData.fromJson(json);
  }
}

class ScreenNavigationData {
  final String? previousScreenRouteName;
  final dynamic previousScreenArguments;

  ScreenNavigationData({
    this.previousScreenRouteName,
    this.previousScreenArguments,
  });

  factory ScreenNavigationData.fromJson(Map<String, dynamic> json) =>
      ScreenNavigationData(
        previousScreenRouteName: json['previousScreenRouteName'],
        previousScreenArguments: json['previousScreenArguments'],
      );

  Map<String, dynamic> toJson() => {
        'previousScreenRouteName': previousScreenRouteName,
        'previousScreenArguments': previousScreenArguments,
      };
}
