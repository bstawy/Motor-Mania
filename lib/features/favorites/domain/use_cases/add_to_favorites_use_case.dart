import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../repos/favorites_repo.dart';

class AddToFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  AddToFavoritesUseCase(this._favoritesRepo);

  Future<Either<ServerFailure, String>> execute(dynamic product) async {
    return await _favoritesRepo.addToFavorites(product);
  }
}
