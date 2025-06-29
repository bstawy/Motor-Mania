import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../models/login_request_body_model.dart';
import '../models/register_request_body.dart';

class AuthRemoteDataSource {
  final CrudManager _crudManager;

  AuthRemoteDataSource(this._crudManager);

  Future<ApiResult<Response>> login(LoginRequestBodyModel requestBody) async {
    return executeApiCall(
      () async {
        return await _crudManager.post(
          EndPoints.login,
          body: requestBody.toJson(),
        );
      },
    );
  }

  Future<ApiResult<Response>> register(
      RegisterRequestBodyModel requestBody) async {
    return await executeApiCall(
      () async {
        return await _crudManager.post(
          EndPoints.register,
          body: requestBody.toJson(),
        );
      },
    );
  }
}
