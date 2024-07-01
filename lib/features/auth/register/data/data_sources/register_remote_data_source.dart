import 'package:dartz/dartz.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../models/register_request_body.dart';
import '../models/register_response.dart';

class RegisterRemoteDataSource {
  final CrudManager _crudManager;

  RegisterRemoteDataSource(this._crudManager);

  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestBodyModel requestBody) async {
    try {
      final response = await _crudManager.post(
        EndPoints.register,
        body: requestBody.toJson(),
        tokenReq: false,
      );

      final result = RegisterResponseModel.fromJson(response.data);

      if (response.statusCode == 200 && result.success) {
        return Right(result);
      }

      return Left(result.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
