import '../../../../../core/networking/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../models/register_request_body.dart';

class RegisterRepo {
  final CrudManager crudManager;

  RegisterRepo(this.crudManager);

  Future<bool> registerUser(RegisterRequestBody requestBody) async {
    try {
      await crudManager.post(
        EndPoints.register,
        body: requestBody.toJson(),
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
