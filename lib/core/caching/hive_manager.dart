import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/cart/domain/entities/cart_product_entity.dart';
import '../../features/home/domain/entities/car_entity.dart';
import '../../features/product_details/domain/entities/product_entity.dart';
import '../config/constants/app_constant_keys.dart';

class HiveManager {
  HiveManager._();

  static HiveManager? _instance;

  static HiveManager getInstance() {
    _instance ??= HiveManager._();
    return _instance!;
  }

  Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _openHiveBoxes();
  }

  void _registerAdapters() {
    Hive.registerAdapter(ProductEntityAdapter());
    Hive.registerAdapter(CartProductEntityAdapter());
    Hive.registerAdapter(CarEntityAdapter());
  }

  Future<void> _openHiveBoxes() async {
    await Hive.openBox<ProductEntity>(HiveBoxKeys.favorites);
    await Hive.openBox<CartProductEntity>(HiveBoxKeys.cart);
  }

  Future<void> cacheDataItem<T>(
      {required String boxKey, required T data}) async {
    var box = Hive.box<T>(boxKey);
    await box.add(data);

    if (!kReleaseMode) {
      log('key: $boxKey\nvalue: $data', name: 'HiveManager::CACHE DATA ITEM');
    }
  }

  Future<void> cacheDataList<T>(
      {required String boxKey, required List<T> data}) async {
    var box = Hive.box<T>(boxKey);
    await box.addAll(data);

    if (!kReleaseMode) {
      log('key: $boxKey\nlength: ${data.length}',
          name: 'HiveManager::CACHE DATA LIST');
    }
  }

  Future<List<T>> retrieveData<T>(String boxKey) async {
    var box = Hive.box<T>(boxKey);
    var data = box.values.toList();

    if (!kReleaseMode) {
      log('key: $boxKey\nlength: ${data.length}',
          name: 'HiveManager::RETRIEVE DATA');
    }

    return data;
  }

  Future<void> deleteItem<T>(
      {required String boxKey, required int index}) async {
    await Hive.box<T>(boxKey).deleteAt(index);

    if (!kReleaseMode) {
      log('key: $boxKey\nindex: $index', name: 'HiveManager::DELETE ITEM');
    }
  }

  Future<void> clearBox<T>(String boxKey) async {
    await Hive.box<T>(boxKey).clear();

    if (!kReleaseMode) {
      log('key: $boxKey', name: 'HiveManager::CLEAR BOX');
    }
  }

  Future<void> clearAllBoxes() async {
    final boxKeys = [HiveBoxKeys.favorites, HiveBoxKeys.cart];
    for (final key in boxKeys) {
      await clearBox(key);
    }

    if (!kReleaseMode) {
      log('clear all boxes', name: 'HiveManager::CLEAR ALL BOXES');
    }
  }
}
