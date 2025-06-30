import '../../../../core/networking/api_result.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/product_repo.dart';
import '../data_sources/product_data_sources.dart';
import '../models/product_model.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductDataSources _productRemoteDataSource;

  ProductRepoImpl(this._productRemoteDataSource);

  @override
  Future<ApiResult<ProductEntity?>> getProductDetails(int id) async {
    final response = await _productRemoteDataSource.getProductDetails(id);

    return response.fold((failure) => Failure(failure.exception), (success) {
      final jsonProduct = success.data.data['data'];

      final ProductEntity product = ProductModel.fromJson(jsonProduct);
      return Success(product);
    });
  }
}
