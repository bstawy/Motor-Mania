import 'package:flutter/material.dart';

import '../custom_snackbar.dart';

extension Snackbar on BuildContext {
  void loadingSnackBar(String message) {
    CustomSnackBar.showLoadingMessage(this, message);
  }

  void successSnackBar(String message) {
    CustomSnackBar.showSuccessMessage(this, message);
  }

  void errorSnackBar(String message) {
    CustomSnackBar.showErrorMessage(this, message);
  }
}
