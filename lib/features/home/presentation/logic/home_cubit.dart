import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/car_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/get_all_categories_use_case.dart';
import '../../domain/use_cases/get_all_products_use_case.dart';
import '../../domain/use_cases/get_category_products_use_case.dart';
import '../../domain/use_cases/get_prodcut_details_use_case.dart';
import '../../domain/use_cases/get_user_selected_car_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUserSelectedCarUseCase _getUserSelectedCarUseCase;
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetCategoryProductsUseCase _getCategoryProductsUseCase;
  final GetProdcutDetailsUseCase _getProdcutDetailsUseCase;

  HomeCubit(
    this._getUserSelectedCarUseCase,
    this._getAllCategoriesUseCase,
    this._getAllProductsUseCase,
    this._getCategoryProductsUseCase,
    this._getProdcutDetailsUseCase,
  ) : super(HomeInitial());

  void getUserCar() {
    emit(UserCarLoading());

    _getUserSelectedCarUseCase.exeute().then((response) {
      response.fold(
        (error) => emit(ErrorState(error)),
        (car) => emit(UserCarLoaded(car)),
      );
    });
  }

  void getProductDetails(int id) {
    emit(ProductDetailsLoading());

    _getProdcutDetailsUseCase.execute(id).then((response) {
      response.fold(
        (error) => emit(ErrorState(error)),
        (product) => emit(ProductDetailsLoaded(product)),
      );
    });
  }

  void getAllCategories() {
    emit(CategoriesLoading());

    _getAllCategoriesUseCase.execute().then((response) {
      response.fold(
        (error) => emit(ErrorState(error)),
        (categories) => emit(CategoriesLoaded(categories)),
      );
    });
  }

  void getCategoryProducts(int categoryId) {
    emit(CategoryProductsLoading());

    _getCategoryProductsUseCase.execute(categoryId).then((response) {
      response.fold(
        (error) => emit(ErrorState(error)),
        (products) => emit(CategoryProductsLoaded(products)),
      );
    });
  }

  void getAllProducts() {
    emit(ProductsLoading());

    _getAllProductsUseCase.execute().then((response) {
      response.fold(
        (error) => emit(ErrorState(error)),
        (products) => emit(ProductsLoaded(products)),
      );
    });
  }
}
