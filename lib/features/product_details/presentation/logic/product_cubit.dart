import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/get_product_details_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  late ProductEntity product;
  int productQuantity = 1;

  ProductCubit(this._getProductDetailsUseCase) : super(ProductInitial());

  void getProductDetails(String id) async {
    emit(ProductLoading());
    final response = await _getProductDetailsUseCase.execute(id);
    response.fold(
      (failure) => emit(ProductError(failure)),
      (product) {
        this.product = product;
        emit(ProductLoaded(product));
      },
    );
  }

  void updateProductQuantity(int quantity) {
    productQuantity = quantity;
    emit(ProductQuantityUpdated(quantity));
  }
}
