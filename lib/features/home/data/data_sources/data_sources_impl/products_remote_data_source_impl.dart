import 'package:dartz/dartz.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../../models/all_products_response_model.dart';
import '../products_remote_data_source.dart';

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final CrudManager _crudManager;

  ProductsRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Either<String, AllProductsResponseModel>> getAllProducts() async {
    try {
      final response = await _crudManager.get(EndPoints.allProducts);

      final allProducts = AllProductsResponseModel.fromJson(response.data);

      if (response.statusCode == 200) {
        return Right(allProducts);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
