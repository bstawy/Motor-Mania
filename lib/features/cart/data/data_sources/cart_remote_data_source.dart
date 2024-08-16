import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/failure/server_failure.dart';
import '../../domain/entities/cart_product_entity.dart';
import '../models/cart_product_model.dart';
import 'cart_data_sources.dart';

class CartRemoteDataSource implements CartDataSources {
  final CrudManager _crudManager;

  CartRemoteDataSource(this._crudManager);

  @override
  Future<Either<ServerFailure, List<CartProductEntity>>>
      getCartProducts() async {
    try {
      final response = await _crudManager.get(
        EndPoints.allCartProducts,
        tokenReq: true,
      );

      if (response.statusCode == 200) {
        final List<CartProductEntity> cartProducts =
            (response.data['data'] as List)
                .map((product) => CartProductModel.fromJson(product))
                .toList();
        return Right(cartProducts);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode,
            message: response.data['statusMessage'],
          ),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: 500,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Response> addProduct(
    int productId,
    int quantity,
  ) {
    final Map<String, dynamic> params = {
      "id": productId,
      "quantity": quantity,
    };

    return _crudManager.post(
      EndPoints.addProductToCart,
      body: params,
      tokenReq: true,
    );
  }

  @override
  Future<Response> removeProduct(int productId) {
    final Map<String, dynamic> params = {"id": productId};

    return _crudManager.delete(
      EndPoints.removeProductFromCart,
      params: params,
      tokenReq: true,
    );
  }
}
