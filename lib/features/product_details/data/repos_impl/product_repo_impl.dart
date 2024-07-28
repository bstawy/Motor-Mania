import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/product_repo.dart';
import '../data_sources/product_data_sources.dart';
import '../models/product_model.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductDataSources _productRemoteDataSource;

  ProductRepoImpl(this._productRemoteDataSource);

  @override
  Future<Either<ServerFailure, ProductEntity>> getProductDetails(
      String id) async {
    try {
      final response = await _productRemoteDataSource.getProductDetails(id);

      if (response.statusCode == 200) {
        return Right(ProductModel.fromJson(response.data['data']));
      }
      return Left(
        ServerFailure(
          statusCode: response.statusCode,
          message: response.statusMessage,
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: 500,
          message: e.toString(),
        ),
      );
    }
  }
}
