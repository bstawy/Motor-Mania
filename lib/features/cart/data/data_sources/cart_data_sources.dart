import 'package:dio/dio.dart';
import 'package:motor_mania/core/networking/api_result.dart';

abstract class CartDataSources {
  Future<ApiResult<Response>> getCartProducts();
  Future<ApiResult<Response>> addProduct(
    int productId,
    int quantity,
  );
  Future<ApiResult<Response>> removeProduct(int productId);
  Future<ApiResult<Response>> applyCoupon({
    required String couponCode,
    required num cartTotal,
  });
}
