abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required super.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message});
}
