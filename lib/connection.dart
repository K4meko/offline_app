import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class ConnectionStatus {
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  bool isConnected = false;

  ConnectionStatus() {
    _subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      _setConnectionStatus(results);
    });
    _checkCurrentConnection();
  }

  Future<void> _checkCurrentConnection() async {
    final results = await Connectivity().checkConnectivity();
    _setConnectionStatus(results);
  }

  void _setConnectionStatus(List<ConnectivityResult> results) {
    isConnected = results.any((result) => result != ConnectivityResult.none);
  }

  void dispose() {
    if (_subscription != null) {
      _subscription!.cancel();
    }
  }
}
