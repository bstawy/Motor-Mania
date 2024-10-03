import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  late PersistentTabController controller;
  bool isBottomSheetOpen = false;

  LayoutCubit() : super(BottomSheetClosedState()) {
    controller = PersistentTabController(initialIndex: 0);
  }

  void openBottomSheet() {
    isBottomSheetOpen = true;
    emit(BottomSheetOpenedState());
  }

  void closeBottomSheet() {
    isBottomSheetOpen = false;
    emit(BottomSheetClosedState());
  }

  void changeTab(int index) {
    controller.jumpToTab(index);
  }

  @override
  void emit(LayoutState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
