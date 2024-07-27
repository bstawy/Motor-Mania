import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/data/models/home_product_model.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../domain/repos/category_repository.dart';
import '../data_sources/category_remote_data_source.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDataSources _remoteDataSource;

  CategoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<ServerFailure, List<HomeProductEntity>>> getCategoryProducts(
      int categoryId) async {
    try {
      final response = await _remoteDataSource.getCategoryProducts(categoryId);

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<HomeProductEntity> categoryProducts =
            (response.data['data'] as List)
                .map((product) => HomeProductModel.fromJson(product))
                .toList();
        return Right(categoryProducts);
      }
      return Left(
        ServerFailure(
          statusCode: response.statusCode,
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(ServerFailure(
        statusCode: 500,
        message: 'Internal Server Error',
      ));
    }
  }
}
