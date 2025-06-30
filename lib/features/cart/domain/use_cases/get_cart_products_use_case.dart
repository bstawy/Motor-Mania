import '../../../../core/helpers/calc_product_final_price.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/cart_product_entity.dart';
import '../repos/cart_repo.dart';

class GetCartProductsUseCase {
  final CartRepo _cartRepository;

  GetCartProductsUseCase(this._cartRepository);

  Future<ApiResult<List<CartProductEntity>?>> call() async {
    final response = await _cartRepository.getCartProducts();

    return response.fold(
      (failure) => Failure<List<CartProductEntity>?>(failure.exception),
      (success) {
        List<CartProductEntity>? cartProducts =
            success.data?.map((cartProduct) {
          final finalPrice = calculateFinalPrice(
            cartProduct.product.oldPrice!,
            cartProduct.product.discountPercentage!,
          );
          return cartProduct.copyWith(
            product: cartProduct.product.copyWith(
              price: finalPrice,
            ),
          );
        }).toList();

        return Success<List<CartProductEntity>?>(cartProducts);
      },
    );
  }
}
