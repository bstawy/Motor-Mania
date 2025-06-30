import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/api_error_model.dart';
import '../../domain/entities/product_entity.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  late ProductEntity product;
  int productQuantity = 1;

  ProductCubit() : super(ProductInitial());

  // void getProductDetails(int id) async {
  //   emit(ProductLoading());
  //   final response = await _getProductDetailsUseCase.execute(id);
  //   response.fold(
  //     (failure) => emit(ProductError(failure)),
  //     (product) {
  //       this.product = product;
  //       emit(ProductLoaded(product));
  //     },
  //   );
  // }

  void updateProductQuantity(int quantity) {
    productQuantity = quantity;
    emit(ProductQuantityUpdated(quantity));
  }
}
