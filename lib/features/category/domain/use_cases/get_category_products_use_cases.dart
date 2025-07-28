import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../repos/category_repository.dart';

class GetCategoryProductsUseCases {
  final CategoryRepository _categoryRepository;

  GetCategoryProductsUseCases(this._categoryRepository);

  Future<ApiResult<List<ProductEntity>?>> call(int categoryId) async {
    return await _categoryRepository.getCategoryProducts(categoryId);
  }
}
