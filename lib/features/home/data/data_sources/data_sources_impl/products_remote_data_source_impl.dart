import 'package:dartz/dartz.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../../../domain/entities/product_entity.dart';
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

  @override
  Future<Either<String, ProductEntity>> getProductDetails(int id) async {
    try {
      final response = await _crudManager
          .get(EndPoints.productDetails, params: {'productId': id});

      if (response.statusCode == 200 && response.data['success']) {
        final product = ProductEntity.fromJson(response.data['data']);
        return Right(product);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
