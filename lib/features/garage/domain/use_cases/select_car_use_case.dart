import '../../../../core/networking/api_result.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../repos/garage_repo.dart';

class SelectCarUseCase {
  final GarageRepo _garageRepo;

  SelectCarUseCase(this._garageRepo);

  Future<ApiResult<CarEntity?>> call(int carId) async {
    return await _garageRepo.selectCar(carId);
  }
}
