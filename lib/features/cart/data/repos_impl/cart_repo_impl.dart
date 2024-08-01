import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../domain/entities/cart_product_entity.dart';
import '../../domain/repos/cart_repo.dart';
import '../data_sources/cart_data_sources.dart';
import '../models/cart_product_model.dart';

class CartRepoImpl implements CartRepo {
  final CartDataSources _remoteDataSource;

  CartRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ServerFailure, List<CartProductEntity>>>
      getCartProducts() async {
    final response = await _remoteDataSource.getCartProducts();

    if (response.statusCode == 200) {
      final List<CartProductEntity> cartProducts =
          (response.data['data'] as List)
              .map(
                (product) => CartProductModel.fromJson(product),
              )
              .toList();

      return Right(cartProducts);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, String>> addProduct(
      String productId, int quantity) async {
    final response = await _remoteDataSource.addProduct(productId, quantity);

    if (response.statusCode == 200) {
      return const Right('Product added to cart successfully');
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, String>> removeProduct(String productId) async {
    final response = await _remoteDataSource.removeProduct(productId);

    if (response.statusCode == 200) {
      return const Right('Product removed from cart successfully');
    } else {
      return Left(ServerFailure());
    }
  }
}
