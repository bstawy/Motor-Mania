import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../models/order_data_model.dart';

class CheckoutRemoteDataSource {
  final CrudManager _crudManager;

  CheckoutRemoteDataSource(this._crudManager);

  Future<ApiResult<Response>> makeOrder(OrderDataModel orderData) async {
    return await executeApiCall(() async {
      return await _crudManager.post(
        EndPoints.makeOrder,
        body: orderData.toJson(),
        tokenReq: true,
      );
    });
  }
}
