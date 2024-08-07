import 'package:dio/dio.dart';

abstract class CartDataSources {
  Future<Response> getCartProducts();
  Future<Response> addProduct(
    String productId,
    int quantity,
  );
  Future<Response> removeProduct(String productId);
}
