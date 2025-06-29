import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../domain/entities/cart_product_entity.dart';

abstract class CartDataSources {
  Future<Either<ServerFailure, List<CartProductEntity>>> getCartProducts();
  Future<Response> addProduct(
    int productId,
    int quantity,
  );
  Future<Response> removeProduct(int productId);
  Future<Response> applyCoupon({
    required String couponCode,
    required num cartTotal,
  });
}
