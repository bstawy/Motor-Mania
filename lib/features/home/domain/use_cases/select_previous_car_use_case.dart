import '../../../../core/helpers/enums/switch_enum.dart';
import '../../../../core/networking/api_result.dart';
import '../../../garage/domain/repos/garage_repo.dart';
import '../entities/car_entity.dart';

class SelectPreviousCarUseCase {
  final GarageRepo _garageRepo;

  SelectPreviousCarUseCase(this._garageRepo);

  Future<ApiResult<CarEntity?>> call() async {
    return await _garageRepo.switchCar(SwitchEnum.previous);
  }
}
