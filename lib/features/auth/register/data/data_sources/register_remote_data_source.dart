import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../models/register_request_body.dart';
import '../models/register_response.dart';

class RegisterRemoteDataSource {
  final CrudManager _crudManager;

  RegisterRemoteDataSource(this._crudManager);

  Future<RegisterResponseModel> register(
      RegisterRequestBodyModel requestBody) async {
    try {
      final response = await _crudManager.post(EndPoints.register,
          body: requestBody.toJson());

      if (response.statusCode == 200) {
        final result = RegisterResponseModel.fromJson(response.data);

        if (result.status == true) {
          return result;
        }
        throw Exception(result.message);
      }

      throw Exception('Failed to register user');
    } catch (e) {
      rethrow;
    }
  }
}
