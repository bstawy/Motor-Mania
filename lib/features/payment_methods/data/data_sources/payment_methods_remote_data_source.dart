import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../models/new_payment_method_model.dart';

class PaymentMethodsRemoteDataSource {
  final CrudManager _crudManager;

  PaymentMethodsRemoteDataSource(this._crudManager);

  Future<ApiResult<Response>> getAllPaymentMethods() async {
    return await executeApiCall(() async {
      return await _crudManager.get(
        EndPoints.allPaymentMethods,
        tokenReq: true,
      );
    });
  }

  Future<ApiResult<Response>> addNewPaymentMethod(
      NewPaymentMethodModel newPaymentMethod) async {
    return await executeApiCall(() async {
      return await _crudManager.post(
        EndPoints.addNewPaymentMethod,
        body: newPaymentMethod.toJson(),
        tokenReq: true,
      );
    });
  }

  Future<ApiResult<Response>> getWalletBalance() async {
    return await executeApiCall(() async {
      return await _crudManager.get(
        EndPoints.getWalletBalance,
        tokenReq: true,
      );
    });
  }

  Future<ApiResult<Response>> depositeToWallet(
      String paymentMethodId, num amount) async {
    return await executeApiCall(() async {
      return await _crudManager.post(
        EndPoints.depositToWallet,
        body: {
          'payment_method_id': paymentMethodId,
          'amount': amount,
        },
        tokenReq: true,
      );
    });
  }
}
