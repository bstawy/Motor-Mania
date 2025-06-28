import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../config/constants/app_constants.dart';
import 'secure_storage_factory.dart';

class NavigationDataManager {
  static saveScreenNavigationData(ScreenNavigationData data) async {
    final jsonString = jsonEncode(data.toJson());
    // Print data
    if (kDebugMode) {
      debugPrint('Screen navigation data saved with >>>>>> $jsonString');
    }
    await CachingPrefsFactory.secureWrite(
      key: CachingKeys.screenNavigationData,
      value: jsonString,
    );
    // await CachingPrefsFactory.writeString(
    //   key: CachingKeys.screenNavigationData,
    //   value: jsonString,
    // );
  }

  static getScreenNavigationData() async {
    final jsonString = await CachingPrefsFactory.secureRead(
      CachingKeys.screenNavigationData,
    );
    // final jsonString =
    //     await CachingPrefsFactory.readString(CachingKeys.screenNavigationData);
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

  static removeScreenNavigationData() async {
    await CachingPrefsFactory.secureDelete(CachingKeys.screenNavigationData);
    // await CachingPrefsFactory.deleteData(CachingKeys.screenNavigationData);
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
