import '../../../../core/networking/api_result.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../repos/garage_repo.dart';

class GetGarageCarsUseCase {
  final GarageRepo _garageRepo;

  GetGarageCarsUseCase(this._garageRepo);

  Future<ApiResult<List<CarEntity>?>> call() async {
    return await _garageRepo.getGarageCars();
  }
}
