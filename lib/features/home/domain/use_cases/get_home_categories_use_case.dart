import '../../../../core/networking/api_result.dart';
import '../entities/category_entity.dart';
import '../repos/home_repo.dart';

class GetHomeCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetHomeCategoriesUseCase(this._homeRepo);

  Future<ApiResult<List<CategoryEntity>?>> execute() async {
    return await _homeRepo.getHomeCategories();
  }
}
