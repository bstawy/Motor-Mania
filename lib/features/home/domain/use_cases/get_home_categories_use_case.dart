import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/category_entity.dart';
import '../repos/home_repo.dart';

class GetHomeCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetHomeCategoriesUseCase(this._homeRepo);

  Future<Either<ServerFailure, List<HomeCategoryEntity>>> execute() async {
    return await _homeRepo.getHomeCategories();
  }
}
