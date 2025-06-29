import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../../domain/use_cases/get_category_products_use_cases.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoryProductsUseCases _getCategoryProductsUseCases;

  CategoryCubit(this._getCategoryProductsUseCases) : super(InitialState());

  void getCategoryProducts(int categoryId) async {
    emit(LoadingState());

    final response = await _getCategoryProductsUseCases(categoryId);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(ErrorState(error));
      },
      (success) => emit(SuccessState(success.data)),
    );
  }
}
