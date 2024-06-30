import 'package:dartz/dartz.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../models/register_request_body.dart';
import '../models/register_response.dart';

class RegisterRepo {
  final CrudManager crudManager;

  RegisterRepo(this.crudManager);

  Future<Either<List<String>, String>> registerUser(
      RegisterRequestBodyModel requestBody) async {
    try {
      final response = await crudManager.post(
        EndPoints.register,
        body: requestBody.toJson(),
      );

      if (response.statusCode == 200) {
        final result = RegisterResponseModel.fromJson(response.data);

        if (result.status == true) {
          return Right(result.message);
        }
        return Left([result.message, result.data.toString()]);
      }
      throw Exception('Failed to register user');
    } catch (e) {
      rethrow;
    }
  }
}
