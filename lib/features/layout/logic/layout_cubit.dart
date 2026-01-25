import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  late PersistentTabController controller;

  LayoutCubit() : super(BottomSheetClosedState()) {
    controller = PersistentTabController(initialIndex: 0);
  }

  bool isBottomSheetOpen = false;
  BuildContext? productDetailsBottomSheetContext;
  bool isProductDetailsBottomSheetOpen = false;

  void changeTab(int index) {
    controller.jumpToTab(index);
  }

  void openBottomSheet() {
    isBottomSheetOpen = true;

    emit(BottomSheetOpenedState());
  }

  void closeBottomSheet() {
    if (!isBottomSheetOpen) return;

    isBottomSheetOpen = false;

    // Safely close product sheet if still open
    if (isProductDetailsBottomSheetOpen) {
      closeProductBottomSheet();
    }

    emit(BottomSheetClosedState());
  }

  void closeProductBottomSheet() {
    if (!isProductDetailsBottomSheetOpen) return;

    // Check if context and navigator are still valid before popping
    final ctx = productDetailsBottomSheetContext;
    if (ctx == null) return;

    final navigator = Navigator.of(ctx);
    if (navigator.canPop()) {
      navigator.pop();
    }

    isProductDetailsBottomSheetOpen = false;
    productDetailsBottomSheetContext = null;
  }

  @override
  void emit(LayoutState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
