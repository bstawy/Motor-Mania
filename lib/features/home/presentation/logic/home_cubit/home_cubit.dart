import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/errors/api_error_model.dart';
import '../../../../product_details/domain/entities/product_entity.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/offer_entity.dart';
import '../../../domain/use_cases/get_best_seller_products_use_case.dart';
import '../../../domain/use_cases/get_home_categories_use_case.dart';
import '../../../domain/use_cases/get_home_offers_use_case.dart';
import '../../../domain/use_cases/get_recommended_products_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeOffersUseCase _getHomeOffersUseCase;
  final GetHomeCategoriesUseCase _getHomeCategoriesUseCase;
  final GetRecommendedProductsUseCase _getRecommendedProductsUseCase;
  final GetBestSellerProductsUseCase _getBestSellerProductsUseCase;

  HomeCubit(
    this._getHomeOffersUseCase,
    this._getHomeCategoriesUseCase,
    this._getRecommendedProductsUseCase,
    this._getBestSellerProductsUseCase,
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

  void getRecommendedProducts() async {
    emit(RecommendedProductsLoading());
    final result = await _getRecommendedProductsUseCase();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(RecommendedProductsError(error));
      },
      (success) => emit(RecommendedProductsLoaded(success.data)),
    );
  }

  void getBestSellerProducts() async {
    emit(BestSellerProductsLoading());
    final result = await _getBestSellerProductsUseCase();

    result.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);
        emit(BestSellerProductsError(error));
      },
      (success) => emit(BestSellerProductsLoaded(success.data)),
    );
  }
}
