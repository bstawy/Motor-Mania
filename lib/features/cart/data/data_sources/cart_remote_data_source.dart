import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import 'cart_data_sources.dart';

class CartRemoteDataSource implements CartDataSources {
  final CrudManager _crudManager;

  CartRemoteDataSource(this._crudManager);

  @override
  Future<Response> getCartProducts() {
    return _crudManager.get(EndPoints.allCartProducts, tokenReq: true);
  }

  @override
  Future<Response> addProduct(
    String productId,
    int quantity,
  ) {
    final Map<String, dynamic> params = {
      "id": productId,
      "quantity": quantity,
    };

    return _crudManager.post(
      EndPoints.addProductToCart,
      body: params,
      tokenReq: true,
    );
  }

  @override
  Future<Response> removeProduct(String productId) {
    final Map<String, dynamic> params = {"id": productId};

    return _crudManager.delete(
      EndPoints.removeProductFromCart,
      params: params,
      tokenReq: true,
    );
  }
}
