import '../../../../core/networking/api_result.dart';
import '../entities/offer_entity.dart';
import '../repos/home_repo.dart';

class GetHomeOffersUseCase {
  final HomeRepo _homeRepo;

  GetHomeOffersUseCase(this._homeRepo);

  Future<ApiResult<List<OfferEntity>?>> call() async {
    return await _homeRepo.getHomeOffers();
  }
}
