part of 'product_cubit.dart';

sealed class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductEntity product;

  ProductLoaded(this.product);
}

class ProductError extends ProductState {
  final ApiErrorModel failure;

  ProductError(this.failure);
}

class ProductQuantityUpdated extends ProductState {
  final int quantity;

  ProductQuantityUpdated(this.quantity);
}

class SimilarProductsLoading extends ProductState {}

class SimilarProductsLoaded extends ProductState {
  final List<ProductEntity> products;

  SimilarProductsLoaded(this.products);
}

class SimilarProductsError extends ProductState {
  final ApiErrorModel failure;

  SimilarProductsError(this.failure);
}
