import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  bool isBottomSheetOpen = false;

  LayoutCubit() : super(BottomSheetClosedState());

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

  void goToPreviousTab() {
    controller.jumpToPreviousTab();
  }
}
