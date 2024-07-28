import 'package:dartz/dartz.dart';

import '../../../../core/helpers/calc_product_final_price.dart';
import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../repos/favorites_repo.dart';

class GetAllFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  GetAllFavoritesUseCase(this._favoritesRepo);

  Future<Either<ServerFailure, List<HomeProductEntity>>> execute() async {
    final response = await _favoritesRepo.getAllFavorites();

    return response.fold(
      (serverFailure) => Left(serverFailure),
      (products) {
        final homeProducts = products.map((product) {
          final finalPrice = calculateFinalPrice(
            product.oldPrice!,
            product.discountPercentage!,
          );
          return product.copyWith(price: finalPrice, isFavorite: true);
        }).toList();

        return Right(homeProducts);
      },
    );
  }
}
