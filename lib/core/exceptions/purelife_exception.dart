import 'package:dio/dio.dart';
import 'package:pure_life/core/exceptions/client_exception.dart';
import 'package:pure_life/core/exceptions/server_exception.dart';

base class PureLifeException implements Exception {
  const PureLifeException();
  factory PureLifeException.fromErrorResponse(Response error) {
    try {
      if (error.statusCode! >= 400 && error.statusCode! < 500) {
        return ServerException.fromJson(error.data as Map<String, dynamic>);
      }
      if (error.statusCode! >= 500) {
        return const ClientException(
            message:
                'We encountered a problem reaching the server. Please try again');
      }
      return const ClientException(message: 'An error occurred.');
    } catch (_) {
      return const ClientException(
          message: 'An error occurred.. Please try again');
    }
  }
}
