import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/offer_entity.dart';
import '../repos/home_repo.dart';

class GetHomeOffersUseCase {
  final HomeRepo _homeRepo;

  GetHomeOffersUseCase(this._homeRepo);

  Future<Either<ServerFailure, List<OfferEntity>>> execute() async {
    return await _homeRepo.getHomeOffers();
  }
}
