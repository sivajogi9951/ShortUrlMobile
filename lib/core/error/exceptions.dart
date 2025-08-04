class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'Server Exception']);
  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'No Internet Connection']);
}