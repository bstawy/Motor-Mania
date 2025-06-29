import '../../../../core/helpers/calc_product_final_price.dart';
import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../repos/search_repo.dart';

class SearchUseCase {
  final SearchRepo _searchRepo;

  SearchUseCase(this._searchRepo);

  Future<ApiResult<List<ProductEntity>?>> call(String query) async {
    final response = await _searchRepo.search(query);

    return response.fold(
      (failure) => Failure<List<ProductEntity>?>(failure.exception),
      (success) {
        List<ProductEntity>? products = success.data?.map((product) {
          final finalPrice = calculateFinalPrice(
            product.oldPrice!,
            product.discountPercentage!,
          );
          return product.copyWith(price: finalPrice);
        }).toList();

        return Success<List<ProductEntity>?>(products);
      },
    );
  }
}
