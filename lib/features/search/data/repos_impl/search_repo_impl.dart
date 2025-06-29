import '../../../../core/networking/api_result.dart';
import '../../../product_details/data/models/product_model.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../../domain/repos/search_repo.dart';
import '../data_sources/search_data_sources.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchDataSources _remoteDataSource;

  SearchRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<ProductEntity>?>> search(String query) async {
    final response = await _remoteDataSource.search(query);

    return response.fold(
      (failure) => Failure<List<ProductEntity>?>(failure.exception),
      (success) {
        final jsonProducts = success.data.data['data'];

        final List<ProductEntity> categoryProducts = (jsonProducts as List)
            .map((product) => ProductModel.fromJson(product))
            .toList();

        return Success<List<ProductEntity>?>(categoryProducts);
      },
    );
  }
}
