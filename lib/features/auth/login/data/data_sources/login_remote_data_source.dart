import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../models/login_request_body_model.dart';
import '../models/login_response_model.dart';

class LoginRemoteDataSource {
  final CrudManager crudManager;

  LoginRemoteDataSource(this.crudManager);

  Future<UserData> login(LoginRequestBodyModel requestBody) async {
    try {
      final response = await crudManager.post(
        EndPoints.login,
        body: requestBody.toJson(),
      );

      if (response.statusCode == 200) {
        final result = LoginResponseModel.fromJson(response.data);

        if (result.status == true) {
          return result.data;
        }
        throw Exception(result.message);
      }
      throw Exception('Failed to login user');
    } catch (e) {
      rethrow;
    }
  }
}
