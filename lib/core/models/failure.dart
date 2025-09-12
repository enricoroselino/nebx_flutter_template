class Failure {
  final String message;
  const Failure(this.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super("Unknown Failure");
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = "Request timed out"]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = "No network connection"]);
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure({this.statusCode = 500, String message = "Server error"})
    : super(message);
}
