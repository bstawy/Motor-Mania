import 'package:dartz/dartz.dart';

import '../data_sources/register_remote_data_source.dart';
import '../models/register_request_body.dart';

class RegisterRepo {
  final RegisterRemoteDataSource _remoteDataSource;
  RegisterRepo(this._remoteDataSource);

  Future<Either<String, String>> registerUser(
      RegisterRequestBodyModel requestBody) async {
    final response = await _remoteDataSource.register(requestBody);

    return response.fold((l) => Left(l), (r) => Right(r.message));
  }
}
