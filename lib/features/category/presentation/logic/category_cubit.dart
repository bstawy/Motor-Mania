import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';
import '../../domain/use_cases/get_category_products_use_cases.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoryProductsUseCases _getCategoryProductsUseCases;

  CategoryCubit(this._getCategoryProductsUseCases) : super(CategoryInitial());

  void getCategoryProducts(int categoryId) async {
    emit(CategoryProductsLoading());
    final response = await _getCategoryProductsUseCases.execute(categoryId);

    response.fold(
      (serverFailure) => emit(ErrorState(serverFailure)),
      (data) => emit(CategoryProductsLoaded(data)),
    );
  }
}
