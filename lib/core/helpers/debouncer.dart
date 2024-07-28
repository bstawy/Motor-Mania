import 'dart:async';

class Debouncer {
  final int milliseconds;
  void Function()? action;
  Timer? _debounceTimer;

  Debouncer({required this.milliseconds});

  void run(void Function() action) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(
      Duration(milliseconds: milliseconds),
      action,
    );
  }
}
