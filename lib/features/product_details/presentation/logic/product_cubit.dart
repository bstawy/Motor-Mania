import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/get_product_details_use_case.dart';
import '../../domain/use_cases/get_similar_product_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  final GetSimilarProductUseCase _getSimilarProductUseCase;

  ProductCubit(this._getProductDetailsUseCase, this._getSimilarProductUseCase)
      : super(ProductInitial());

  void getProductDetails(String id) async {
    emit(ProductLoading());
    final response = await _getProductDetailsUseCase.execute(id);
    response.fold(
      (failure) => emit(ProductError(failure)),
      (product) => emit(ProductLoaded(product)),
    );
  }

  void getSimilarProducts() async {
    final response = await _getSimilarProductUseCase.execute();
    response.fold(
      (failure) => emit(ProductError(failure)),
      (products) => emit(SimilarProductsLoaded(products)),
    );
  }
}
