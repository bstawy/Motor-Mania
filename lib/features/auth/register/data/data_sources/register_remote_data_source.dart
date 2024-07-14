import 'package:dartz/dartz.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../../../models/auth_response_model.dart';
import '../../../models/user_data_model.dart';
import '../models/register_request_body.dart';

class RegisterRemoteDataSource {
  final CrudManager _crudManager;

  RegisterRemoteDataSource(this._crudManager);

  Future<Either<String, UserData>> register(
      RegisterRequestBodyModel requestBody) async {
    try {
      final response = await _crudManager.post(
        EndPoints.register,
        body: requestBody.toJson(),
      );

      final result = AuthResponseModel.fromJson(response.data);

      if (response.statusCode == 201 && result.success) {
        return Right(result.data!);
      }

      return Left(result.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
