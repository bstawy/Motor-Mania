import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/errors/api_error_model.dart';
import '../../../../product_details/domain/entities/product_entity.dart';
import '../../../domain/entities/category_entity.dart';
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
    final result = await _getHomeOffersUseCase();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(OffersError(error));
      },
      (success) => emit(OffersLoaded(success.data)),
    );
  }

  void getHomeCategories() async {
    emit(CategoriesLoading());
    final result = await _getHomeCategoriesUseCase();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(CategoriesError(error));
      },
      (success) => emit(CategoriesLoaded(success.data)),
    );
  }

  void getHomeProducts() async {
    emit(ProductsLoading());
    final result = await _getHomeProductsUseCase();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(ProductsError(error));
      },
      (success) => emit(ProductsLoaded(success.data)),
    );
  }
}
