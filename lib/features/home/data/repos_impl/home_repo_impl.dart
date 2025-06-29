import '../../../../core/networking/api_result.dart';
import '../../../product_details/data/models/product_model.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/offer_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/home_data_sources.dart';
import '../models/category_model.dart';
import '../models/offer_model.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSources _remoteDataSource;

  HomeRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<OfferEntity>?>> getHomeOffers() async {
    final response = await _remoteDataSource.getOffers();

    return response.fold(
      (failure) => Failure<List<OfferEntity>?>(failure.exception),
      (success) {
        final jsonOffers = success.data.data['data'];
        final List<OfferModel> offers =
            (jsonOffers as List).map((i) => OfferModel.fromJson(i)).toList();
        return Success(offers);
      },
    );
  }

  @override
  Future<ApiResult<List<CategoryEntity>?>> getHomeCategories() async {
    final response = await _remoteDataSource.getCategories();

    return response.fold(
      (failure) => Failure<List<CategoryEntity>?>(failure.exception),
      (success) {
        final jsonCategories = success.data.data['data'];
        final List<CategoryModel> categories = (jsonCategories as List)
            .map((i) => CategoryModel.fromJson(i))
            .toList();
        return Success(categories);
      },
    );
  }

  @override
  Future<ApiResult<List<ProductEntity>?>> getHomeProducts() async {
    final response = await _remoteDataSource.getProducts();

    return response
        .fold((failure) => Failure<List<ProductEntity>?>(failure.exception),
            (success) {
      final jsonProducts = success.data.data['data'];
      final List<ProductModel> products =
          (jsonProducts as List).map((i) => ProductModel.fromJson(i)).toList();
      return Success(products);
    });
  }
}
