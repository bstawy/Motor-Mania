import '../../../../core/networking/api_result.dart';
import '../entities/car_entity.dart';
import '../repos/home_repo.dart';

class GetUserSelectedCarUseCase {
  final HomeRepo _homeRepo;

  GetUserSelectedCarUseCase(this._homeRepo);

  Future<ApiResult<CarEntity?>> execute() async {
    return await _homeRepo.getUserCar();
  }
}
