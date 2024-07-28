import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/data/models/home_product_model.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../domain/repos/search_repo.dart';
import '../data_sources/search_data_sources.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchDataSources _remoteDataSource;

  SearchRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ServerFailure, List<HomeProductEntity>>> search(
      String query) async {
    try {
      final response = await _remoteDataSource.search(query);

      if (response.statusCode == 200) {
        final List<HomeProductEntity> searchResult =
            (response.data['data'] as List)
                .map((product) => HomeProductModel.fromJson(product))
                .toList();
        return Right(searchResult);
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
