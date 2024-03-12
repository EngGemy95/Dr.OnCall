import 'dart:io';

import 'package:dio/dio.dart';

import './Failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else if (error is SocketException) {
      failure = DataSource.noInternetConnection.getFailure();
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return Failure(
          "", '${StatusCode.zero}', ResponseMessage.connectionTimeout);
    case DioExceptionType.sendTimeout:
      return Failure("", '${StatusCode.zero}', ResponseMessage.sendTimeout);
    case DioExceptionType.receiveTimeout:
      return Failure("", '${StatusCode.zero}', ResponseMessage.receiveTimeout);
    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode;
      if (statusCode != null) {
        switch (statusCode) {
          case StatusCode.badRequest:
            return DataSource.badRequest.getFailure();
          case StatusCode.unAuthorized:
            return DataSource.unAuthorized.getFailure();
          case StatusCode.forbidden:
            return DataSource.forbidden.getFailure();
          case StatusCode.notFound:
            return DataSource.notFound.getFailure();
          case StatusCode.conflict:
            return DataSource.conflict.getFailure();
          case StatusCode.internalServerError:
            return DataSource.internalServerError.getFailure();
        }
      }
      return DataSource.badResponse.getFailure();

    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.internalServerError.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  badRequest,
  forbidden,
  notFound,
  conflict,
  internalServerError,
  noInternetConnection,
  rateLimited,
  DEFAULT,
  unAuthorized,
  badResponse,
  cancel,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(
            "", '${StatusCode.badRequest}', ResponseMessage.badRequest);
      case DataSource.unAuthorized:
        return Failure(
            "", '${StatusCode.unAuthorized}', ResponseMessage.unAuthorized);
      case DataSource.forbidden:
        return Failure(
            "", '${StatusCode.forbidden}', ResponseMessage.forbidden);
      case DataSource.notFound:
        return Failure("", '${StatusCode.notFound}',
            ResponseMessage.noInternetConncention);
      case DataSource.conflict:
        return Failure("", '${StatusCode.conflict}', ResponseMessage.conflict);
      case DataSource.internalServerError:
        return Failure("", '${StatusCode.internalServerError}',
            ResponseMessage.internalServerError);

      case DataSource.rateLimited:
        return Failure("", '${StatusCode.zero}', ResponseMessage.rateLimited);
      case DataSource.noInternetConnection:
        return Failure(
            "", '${StatusCode.zero}', ResponseMessage.noInternetConncention);
      case DataSource.DEFAULT:
        return Failure("", '${StatusCode.zero}', ResponseMessage.DEFAULT);
      case DataSource.cancel:
        return Failure("", 'cancel', ResponseMessage.requestCanceled);
      case DataSource.badResponse:
        return Failure("", 'badResponse', ResponseMessage.badResponse);
    }
  }
}

class StatusCode {
  static const int badRequest = 400; // success with data
  static const int unAuthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int internalServerError = 500;
  static const int zero = 0;
}

class ResponseMessage {
  static const String unAuthorized = "Unauthorized";
  static const String badRequest = "badRequest";
  static const String forbidden = "forbidden";
  static const String error = "Error";
  static const String notFound = "notFound";
  static const String conflict = "conflict";
  static const String internalServerError = "internalServerError";
  static const String requestCanceled = "Request Canceled";
  static const String rateLimited = "RATE LIMITED";
  static const String connectionTimeout = "Connection Timeout";
  static const String sendTimeout = "Send Timeout";
  static const String receiveTimeout = "Receive Timeout";
  static const String badResponse = "Bad Response";
  static const String noInternetConncention =
      "Please check your internet connection";
  static const String DEFAULT = "some thing went error , Try again later";
}
