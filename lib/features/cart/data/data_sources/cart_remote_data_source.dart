import 'package:dio/dio.dart';
import 'package:motor_mania/core/networking/generic_api_call.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import 'cart_data_sources.dart';

class CartRemoteDataSource implements CartDataSources {
  final CrudManager _crudManager;

  CartRemoteDataSource(this._crudManager);

  @override
  Future<ApiResult<Response>> getCartProducts() async {
    return await executeApiCall(() async {
      return await _crudManager.get(
        EndPoints.allCartProducts,
        tokenReq: true,
      );
    });
  }

  @override
  Future<ApiResult<Response>> addProduct(
    int productId,
    int quantity,
  ) async {
    final Map<String, dynamic> params = {
      "id": productId,
      "quantity": quantity,
    };

    return await executeApiCall(() async {
      return await _crudManager.post(
        EndPoints.addProductToCart,
        body: params,
        tokenReq: true,
      );
    });
  }

  @override
  Future<ApiResult<Response>> removeProduct(int productId) async {
    final Map<String, dynamic> params = {"id": productId};

    return await executeApiCall(() async {
      return await _crudManager.delete(
        EndPoints.removeProductFromCart,
        params: params,
        tokenReq: true,
      );
    });
  }

  @override
  Future<ApiResult<Response>> applyCoupon(
      {required String couponCode, required num cartTotal}) async {
    final Map<String, dynamic> params = {
      "coupon_code": couponCode,
      "cart_total": cartTotal,
    };

    return await executeApiCall(() async {
      return await _crudManager.post(
        EndPoints.applyCoupon,
        body: params,
        tokenReq: true,
      );
    });
  }
}
