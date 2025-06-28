import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/failure/server_failure.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/home_product_entity.dart';
import '../../../domain/entities/offer_entity.dart';
import '../../../domain/use_cases/get_home_categories_use_case.dart';
import '../../../domain/use_cases/get_home_offers_use_case.dart';
import '../../../domain/use_cases/get_home_products_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeOffersUseCase _getHomeOffersUseCase;
  final GetHomeCategoriesUseCase _getHomeCategoriesUseCase;
  final GetHomeProductsUseCase _getHomeProductsUseCase;

  HomeCubit(
    this._getHomeOffersUseCase,
    this._getHomeCategoriesUseCase,
    this._getHomeProductsUseCase,
  ) : super(HomeInitial());

  void getHomeOffers() async {
    emit(OffersLoading());
    final result = await _getHomeOffersUseCase.execute();

    result.fold(
      (error) => emit(OffersError(error)),
      (offers) => emit(OffersLoaded(offers)),
    );
  }

  void getHomeCategories() async {
    emit(CategoriesLoading());
    final result = await _getHomeCategoriesUseCase.execute();

    result.fold(
      (error) => emit(CategoriesError(error)),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }

  void getHomeProducts() async {
    emit(ProductsLoading());
    final result = await _getHomeProductsUseCase.execute();

    result.fold(
      (error) => emit(ProductsError(error)),
      (products) => emit(ProductsLoaded(products)),
    );
  }
}
