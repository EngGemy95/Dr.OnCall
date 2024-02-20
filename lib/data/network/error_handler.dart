import 'package:dio/dio.dart';

import './Failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.badResponse:
      return DataSource.unAuthorized.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  RATE_LIMITED,
  NO_INTERNET_CONNECTION,
  DEFAULT,
  unAuthorized,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.RATE_LIMITED:
        return Failure(
            "error", ResponseCode.RATE_LIMITED, ResponseMessage.RATE_LIMITED);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure("error", ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.noInternetConncention);
      case DataSource.unAuthorized:
        return Failure("error", ResponseCode.unAuthorized.toString(),
            ResponseMessage.unauthorized);
      case DataSource.DEFAULT:
        return Failure("error", ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  static const String RATE_LIMITED = "rateLimited"; // success with data
  static const String NO_INTERNET_CONNECTION = "No Internet Connection";
  static const String DEFAULT = "-";
  static const int unAuthorized = 401;
}

class ResponseMessage {
  static const String unauthorized = "Unauthorized"; // success with data
  static const String error = "Error"; // Error with data
  static const String RATE_LIMITED = "RATE LIMITED"; // Error with data
  static const String noInternetConncention =
      "Please check your internet connection";
  static const String DEFAULT = "some thing went error , Try again later";
}
