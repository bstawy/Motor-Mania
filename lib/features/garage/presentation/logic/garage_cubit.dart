import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/failure/server_failure.dart';

part 'garage_state.dart';

class GarageCubit extends Cubit<GarageState> {
  GarageCubit() : super(GarageInitial());

  void getGarage() {
    emit(GarageLoaded());
  }
}
