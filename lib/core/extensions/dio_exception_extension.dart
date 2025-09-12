import 'package:dio/dio.dart';
import 'package:nebx_flutter_template/core/models/failure.dart';

extension DioExceptionX on DioException {
  Failure toFailure() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure();

      case DioExceptionType.connectionError:
        return const NetworkFailure();

      case DioExceptionType.badResponse:
        return ServerFailure(
          statusCode: response?.statusCode,
          message: response?.statusMessage ?? "Server error",
        );

      case DioExceptionType.cancel:
        return const Failure("Request cancelled");

      case DioExceptionType.unknown:
      default:
        return const UnknownFailure();
    }
  }
}
