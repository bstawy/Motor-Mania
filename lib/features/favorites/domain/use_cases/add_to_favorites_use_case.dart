import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/failures.dart';
import '../repos/favorites_repo.dart';

class AddToFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  AddToFavoritesUseCase(this._favoritesRepo);

  Future<Either<ServerFailure, String>> execute(String id) async {
    return await _favoritesRepo.addToFavorites(id);
  }
}
