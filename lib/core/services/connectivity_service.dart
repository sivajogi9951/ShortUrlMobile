import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();

  factory ConnectivityService() => _instance;

  final Connectivity _connectivity = Connectivity();

  ConnectivityService._internal();

  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result.first != ConnectivityResult.none;
  }

  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
