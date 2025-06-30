import '../../../../core/helpers/calc_product_final_price.dart';
import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../repos/category_repository.dart';

class GetCategoryProductsUseCases {
  final CategoryRepository _categoryRepository;

  GetCategoryProductsUseCases(this._categoryRepository);

  Future<ApiResult<List<ProductEntity>?>> call(int categoryId) async {
    final response = await _categoryRepository.getCategoryProducts(categoryId);

    return response.fold(
      (failure) => Failure<List<ProductEntity>?>(failure.exception),
      (success) {
        List<ProductEntity>? categoryProducts = success.data?.map((product) {
          final finalPrice = calculateFinalPrice(
            product.oldPrice!,
            product.discountPercentage!,
          );
          return product.copyWith(price: finalPrice);
        }).toList();

        return Success<List<ProductEntity>?>(categoryProducts);
      },
    );
  }
}
