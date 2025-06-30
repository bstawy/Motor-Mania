import '../../../../core/helpers/enums/switch_enum.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/car_model.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../../domain/repos/garage_repo.dart';
import '../data_sources/garage_remote_data_source.dart';
import '../models/add_car_model.dart';

class GarageRepoImpl extends GarageRepo {
  final GarageRemoteDataSource _remoteDataSource;

  GarageRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<CarEntity>?>> getGarageCars() async {
    final response = await _remoteDataSource.getGarageCars();

    return response.fold(
      (failure) => Failure(failure.exception),
      (success) {
        final jsonCars = success.data.data['data'];

        final List<CarModel> cars =
            (jsonCars as List).map((car) => CarModel.fromJson(car)).toList();

        return Success(cars);
      },
    );
  }

  @override
  Future<ApiResult<CarEntity?>> selectCar(int carId) async {
    final response = await _remoteDataSource.selectCar(carId);

    return response.fold(
      (failure) => Failure(failure.exception),
      (success) {
        final jsonCar = success.data.data['data'];

        final CarEntity car = CarModel.fromJson(jsonCar);

        return Success(car);
      },
    );
  }

  @override
  Future<ApiResult<CarEntity?>> getUserCar() async {
    final response = await _remoteDataSource.getUserCar();

    return response.fold(
      (failure) => Failure<CarEntity?>(failure.exception),
      (success) async {
        final jsonCar = success.data.data['data'];
        final CarModel userCar = CarModel.fromJson(jsonCar);
        return Success(userCar);
      },
    );
  }

  @override
  Future<ApiResult<CarEntity?>> switchCar(SwitchEnum switchValue) async {
    final response = await _remoteDataSource.switchCar(switchValue);

    return response.fold(
      (failure) => Failure<CarEntity?>(failure.exception),
      (success) async {
        final jsonCar = success.data.data['data'];
        final CarModel switchedCar = CarModel.fromJson(jsonCar);
        return Success(switchedCar);
      },
    );
  }

  @override
  Future<ApiResult<void>> addCar(AddCarModel car) async {
    return await _remoteDataSource.addCar(car);
  }

  @override
  Future<ApiResult<void>> removeCar(int carId) async {
    return await _remoteDataSource.removeCar(carId);
  }
}
