import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../product_details/domain/entities/product_entity.dart';
import '../../domain/use_cases/search_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;

  SearchCubit(this._searchUseCase) : super(SearchInitial());

  void search(String query) async {
    if (query.isEmpty) {
      emit(SearchEmpty());
      return;
    }
    emit(SearchLoading());

    final response = await _searchUseCase(query);

    response.fold(
      (failure) {
        final ApiErrorModel error = ApiErrorHandler.handle(failure.exception);

        if (error.statusCode == 404) {
          emit(SearchEmpty());
        } else {
          emit(SearchError(error));
        }
      },
      (success) {
        if (success.data == null || success.data!.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchLoaded(success.data!));
        }
      },
    );
  }
}
