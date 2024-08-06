import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/failure/server_failure.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/home_product_entity.dart';
import '../../../domain/use_cases/get_home_categories_use_case.dart';
import '../../../domain/use_cases/get_home_products_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeCategoriesUseCase _getHomeCategoriesUseCase;
  final GetHomeProductsUseCase _getHomeProductsUseCase;

  HomeCubit(
    this._getHomeCategoriesUseCase,
    this._getHomeProductsUseCase,
  ) : super(HomeInitial());

  void getHomeCategories() {
    emit(CategoriesLoading());
    _getHomeCategoriesUseCase.execute().then((response) {
      response.fold(
        (error) => emit(CategoriesErrorState(error)),
        (categories) => emit(CategoriesLoaded(categories)),
      );
    });
  }

  void getHomeProducts() {
    emit(ProductsLoading());

    _getHomeProductsUseCase.execute().then((response) {
      response.fold(
        (error) => emit(ProductsErrorState(error)),
        (products) => emit(ProductsLoaded(products)),
      );
    });
  }
}
