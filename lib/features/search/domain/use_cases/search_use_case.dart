import '../../../../core/networking/api_result.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../repos/search_repo.dart';

class SearchUseCase {
  final SearchRepo _searchRepo;

  SearchUseCase(this._searchRepo);

  Future<ApiResult<List<ProductEntity>?>> call(String query) async {
    return await _searchRepo.search(query);
  }
}
