import '../../../../core/networking/api_result.dart';
import '../repos/garage_repo.dart';

class RemoveCarUseCase {
  final GarageRepo _repo;

  RemoveCarUseCase(this._repo);

  Future<ApiResult<void>> call(int carId) async {
    return await _repo.removeCar(carId);
  }
}
