import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/failures.dart';
import '../repos/favorites_repo.dart';

class RemoveFromFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  RemoveFromFavoritesUseCase(this._favoritesRepo);

  Future<Either<ServerFailure, String>> execute(String id) async {
    return await _favoritesRepo.removeFromFavorites(id);
  }
}
