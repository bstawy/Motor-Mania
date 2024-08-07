import 'package:hive_flutter/hive_flutter.dart';

import '../../features/cart/domain/entities/cart_product_entity.dart';
import '../../features/home/domain/entities/car_entity.dart';
import '../../features/home/domain/entities/home_product_entity.dart';
import '../../features/product_details/domain/entities/product_entity.dart';
import '../config/constants/caching_constants.dart';

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
    Hive.registerAdapter(HomeProductEntityAdapter());
    Hive.registerAdapter(CartProductEntityAdapter());
    Hive.registerAdapter(CarEntityAdapter());
  }

  Future<void> _openHiveBoxes() async {
    await Hive.openBox<HomeProductEntity>(HiveBoxKeys.favorites);
    await Hive.openBox<CartProductEntity>(HiveBoxKeys.cart);
  }

  Future<void> cacheDataItem<T>(
      {required String boxKey, required T data}) async {
    var box = Hive.box<T>(boxKey);
    await box.add(data);
  }

  Future<void> cacheDataList<T>(
      {required String boxKey, required List<T> data}) async {
    var box = Hive.box<T>(boxKey);
    await box.addAll(data);
  }

  Future<List<T>> retrieveData<T>(String boxKey) async {
    var box = Hive.box<T>(boxKey);
    return box.values.toList();
  }

  Future<void> clearData<T>(String boxKey) async {
    await Hive.box<T>(boxKey).clear();
  }

  Future<void> clearItem<T>(
      {required String boxKey, required int index}) async {
    await Hive.box<T>(boxKey).deleteAt(index);
  }

  Future<void> clearAllBoxes() async {
    await Hive.box<HomeProductEntity>(HiveBoxKeys.favorites).clear();
    await Hive.box<CartProductEntity>(HiveBoxKeys.cart).clear();
  }
}
