import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/failures.dart';
import '../../domain/entities/car_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/home_product_entity.dart';
import '../../domain/use_cases/get_home_categories_use_case.dart';
import '../../domain/use_cases/get_home_products_use_case.dart';
import '../../domain/use_cases/get_user_selected_car_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUserSelectedCarUseCase _getUserSelectedCarUseCase;
  final GetHomeCategoriesUseCase _getHomeCategoriesUseCase;
  final GetHomeProductsUseCase _getHomeProductsUseCase;

  HomeCubit(
    this._getUserSelectedCarUseCase,
    this._getHomeCategoriesUseCase,
    this._getHomeProductsUseCase,
  ) : super(HomeInitial());

  void getUserCar() {
    emit(UserCarLoading());

    _getUserSelectedCarUseCase.execute().then((response) {
      response.fold(
        (error) => emit(UserCarErrorState(error)),
        (car) => emit(UserCarLoaded(car)),
      );
    });
  }

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
