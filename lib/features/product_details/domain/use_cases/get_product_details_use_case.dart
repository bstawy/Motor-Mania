import '../../../../core/networking/api_result.dart';
import '../entities/product_entity.dart';
import '../repos/product_repo.dart';

class GetProductDetailsUseCase {
  final ProductRepo _productRepo;

  GetProductDetailsUseCase(this._productRepo);

  Future<ApiResult<ProductEntity?>> execute(int id) async {
    final response = await _productRepo.getProductDetails(id);

    return response.fold(
      (failure) => Failure(failure.exception),
      (success) {
        final finalPrice = calculateFinalPrice(
          success.data?.oldPrice ?? 0,
          success.data?.discountPercentage ?? 0,
        );

        return Success(success.data?.copyWith(price: finalPrice));
      },
    );
  }

  double calculateFinalPrice(num oldPrice, num discountPercentage) {
    return oldPrice - (oldPrice * discountPercentage / 100);
  }
}
