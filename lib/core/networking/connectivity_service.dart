import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Function(bool isConnected)? onConnectivityChanged;

  Future<bool> checkConnection() async {
    final result = await _connectivity.checkConnectivity();
    final isConnected = result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet);
    return isConnected;
  }

  /// Start monitoring connectivity
  void startMonitoring() {
    _subscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      final isConnected = result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.ethernet);

      onConnectivityChanged?.call(isConnected);
    });
  }

  /// Cancel monitoring when no longer needed
  void dispose() {
    _subscription?.cancel();
  }
}
