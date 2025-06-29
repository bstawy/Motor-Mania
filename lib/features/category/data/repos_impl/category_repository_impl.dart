import '../../../../core/networking/api_result.dart';
import '../../../product_details/data/models/product_model.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../../domain/repos/category_repository.dart';
import '../data_sources/category_data_sources.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDataSources _remoteDataSource;

  CategoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<ProductEntity>?>> getCategoryProducts(
      int categoryId) async {
    final response = await _remoteDataSource.getCategoryProducts(categoryId);

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
