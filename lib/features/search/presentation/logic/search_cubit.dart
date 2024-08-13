import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/home_product_entity.dart';
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
    final response = await _searchUseCase.search(query);
    response.fold(
      (serverFailure) {
        if (serverFailure.statusCode == 404) {
          emit(SearchEmpty());
          return;
        }
        emit(SearchError(serverFailure));
      },
      (products) => emit(SearchLoaded(products)),
    );
  }
}
