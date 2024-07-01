import 'package:dartz/dartz.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../models/login_request_body_model.dart';
import '../models/login_response_model.dart';

class LoginRemoteDataSource {
  final CrudManager _crudManager;

  LoginRemoteDataSource(this._crudManager);

  Future<Either<String, UserData>> login(
      LoginRequestBodyModel requestBody) async {
    try {
      final response = await _crudManager.post(
        EndPoints.login,
        body: requestBody.toJson(),
        tokenReq: false,
      );

      final result = LoginResponseModel.fromJson(response.data);

      if (response.statusCode == 200 && result.success) {
        return Right(result.data!);
      }

      return Left(result.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
