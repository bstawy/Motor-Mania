import '../../../../core/helpers/enums/switch_enum.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/car_entity.dart';
import '../repos/home_repo.dart';

class SelectNextCarUseCase {
  final HomeRepo _homeRepo;

  SelectNextCarUseCase(this._homeRepo);

  Future<ApiResult<CarEntity?>> execute() async {
    return await _homeRepo.switchCar(SwitchEnum.next);
  }
}
