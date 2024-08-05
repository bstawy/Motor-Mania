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

  void cacheDataItem<T>({required String boxKey, required T data}) async {
    var box = Hive.box<T>(boxKey);
    box.add(data);
  }

  void cacheDataList<T>({required String boxKey, required List<T> data}) async {
    var box = Hive.box<T>(boxKey);
    box.addAll(data);
  }

  List<T> retrieveData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);
    return box.values.toList();
  }

  void clearData<T>(String boxKey) {
    Hive.box<T>(boxKey).clear();
  }

  void clearItem<T>({required String boxKey, required int index}) {
    Hive.box<T>(boxKey).deleteAt(index);
  }

  void clearAllData() {
    Hive.box<HomeProductEntity>(HiveBoxKeys.favorites).clear();
    Hive.box<CartProductEntity>(HiveBoxKeys.cart).clear();
  }
}
