import 'package:dartz/dartz.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repos/products_repo.dart';
import '../data_sources/products_remote_data_source.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ProductsRemoteDataSource _productsRemoteDataSource;

  ProductsRepoImpl(this._productsRemoteDataSource);

  @override
  Future<Either<String, List<ProductEntity>>> getProducts() async {
    final response = await _productsRemoteDataSource.getAllProducts();

    return response.fold(
      (error) => Left(error),
      (allProductsResponse) {
        final categories = allProductsResponse.products;

        return Right(categories);
      },
    );
  }

  @override
  Future<Either<String, ProductEntity>> getProductDetails(int id) async {
    return await _productsRemoteDataSource.getProductDetails(id);
  }
}
