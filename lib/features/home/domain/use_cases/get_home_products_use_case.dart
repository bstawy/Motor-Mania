import '../../../../core/helpers/calc_product_final_price.dart';
import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../repos/home_repo.dart';

class GetHomeProductsUseCase {
  final HomeRepo _homeRepo;

  GetHomeProductsUseCase(this._homeRepo);

  Future<ApiResult<List<ProductEntity>?>> call() async {
    final response = await _homeRepo.getHomeProducts();

    return response.fold(
      (failure) => Failure<List<ProductEntity>?>(failure.exception),
      (success) {
        List<ProductEntity>? homeProducts = success.data?.map((product) {
          final finalPrice = calculateFinalPrice(
            product.oldPrice!,
            product.discountPercentage!,
          );
          return product.copyWith(price: finalPrice);
        }).toList();

        return Success<List<ProductEntity>?>(homeProducts);
      },
    );
  }
}
