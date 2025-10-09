import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'Connection timeout with api server.',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with api server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Recieve timeout with api server.');
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage: 'Connection failed. Please try again later.',
        );
      case DioExceptionType.badResponse:
        Response? response = dioException.response;
        int? statusCode = response!.statusCode;

        return ServerFailure.fromBadResponse(
          statusCode: statusCode!,
          response: response.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: 'Request with api server was canceled.',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage:
              'Unable to connect to the server. Please check your internet connection and try again.',
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: 'An unexpected error occurred. Please try again later.',
        );
    }
  }

  factory ServerFailure.fromBadResponse({
    required int statusCode,
    required dynamic response,
  }) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        errorMessage: 'Your request not found, Please try again later.',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal server error, Please try again later.',
      );
    } else {
      return ServerFailure(
        errorMessage: 'Opps there was an error, Please try again later.',
      );
    }
  }
}
