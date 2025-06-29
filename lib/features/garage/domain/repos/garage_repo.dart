import '../../../../core/helpers/enums/switch_enum.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../../data/models/add_car_model.dart';

abstract class GarageRepo {
  Future<ApiResult<List<CarEntity>?>> getGarageCars();
  Future<ApiResult<CarEntity?>> selectCar(int carId);
  Future<ApiResult<CarEntity?>> getUserCar();
  Future<ApiResult<CarEntity?>> switchCar(SwitchEnum switchValue);
  Future<ApiResult<void>> addCar(AddCarModel car);
  Future<ApiResult<void>> removeCar(int carId);
}
