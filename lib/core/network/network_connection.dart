import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkConnection {
  Future<bool> get isConnected;
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfoImpl implements NetworkConnection {
  final Connectivity connectivity;
  NetworkInfoImpl({required this.connectivity});

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}

class NetworkConnectionImpl implements NetworkConnection {
  final InternetConnectionChecker connectionChecker;
  NetworkConnectionImpl({required this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Future<ConnectivityResult> get connectivityResult =>
      throw UnimplementedError();

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      throw UnimplementedError();
}
