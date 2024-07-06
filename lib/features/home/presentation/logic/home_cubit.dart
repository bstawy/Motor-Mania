import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/use_cases/get_all_categories_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;

  HomeCubit(this._getAllCategoriesUseCase) : super(HomeInitial());

  void getAllCategories() {
    emit(CategoriesLoading());

    _getAllCategoriesUseCase.execute().then((response) {
      response.fold(
        (error) => emit(CategoriesError(error)),
        (categories) => emit(CategoriesLoaded(categories)),
      );
    });
  }
}
