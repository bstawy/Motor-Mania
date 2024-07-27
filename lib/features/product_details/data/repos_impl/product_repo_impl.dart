import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/data/data_sources/home_data_sources.dart';
import '../../../home/data/models/home_product_model.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/product_repo.dart';
import '../data_sources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductRemoteDataSource _productRemoteDataSource;
  final HomeDataSources _homeRemoteDataSource;

  ProductRepoImpl(this._productRemoteDataSource, this._homeRemoteDataSource);

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

  @override
  Future<Either<ServerFailure, List<HomeProductEntity>>>
      getSimilarProducts() async {
    try {
      final response = await _homeRemoteDataSource.getHomeProducts();

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<HomeProductModel> homeProducts =
            (response.data['data'] as List)
                .map((i) => HomeProductModel.fromJson(i))
                .toList();

        return Right(homeProducts);
      }

      return Left(
        ServerFailure(
          statusCode: response.statusCode,
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: 400,
          message: e.toString(),
        ),
      );
    }
  }
}
