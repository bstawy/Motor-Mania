import '../../../../core/networking/api_result.dart';
import '../../data/models/add_car_model.dart';
import '../repos/garage_repo.dart';

class AddCarUseCase {
  final GarageRepo _repo;

  AddCarUseCase(this._repo);

  Future<ApiResult<void>> call(AddCarModel car) async {
    return await _repo.addCar(car);
  }
}
