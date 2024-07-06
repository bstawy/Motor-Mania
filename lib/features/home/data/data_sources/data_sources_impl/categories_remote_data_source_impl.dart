import 'package:dartz/dartz.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../../models/all_categories_response_model.dart';
import '../categories_remote_data_source.dart';

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  final CrudManager _crudManager;

  CategoriesRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Either<String, AllCategoriesResponseModel>> getAllCategories() async {
    try {
      final response = await _crudManager.get(EndPoints.allCategories);

      final allCategories = AllCategoriesResponseModel.fromJson(response.data);

      if (response.statusCode == 200) {
        return Right(allCategories);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
