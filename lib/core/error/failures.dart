// Base failure class
abstract class Failure {
  final String message;
  const Failure(this.message);
}

// Server failure
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

// Network failure
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}