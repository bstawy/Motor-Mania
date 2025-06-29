import '../../../../core/networking/api_result.dart';
import '../../../garage/domain/repos/garage_repo.dart';
import '../entities/car_entity.dart';

class GetUserSelectedCarUseCase {
  final GarageRepo _garageRepo;

  GetUserSelectedCarUseCase(this._garageRepo);

  Future<ApiResult<CarEntity?>> call() async {
    return await _garageRepo.getUserCar();
  }
}
