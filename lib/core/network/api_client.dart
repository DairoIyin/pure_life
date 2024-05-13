import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:pure_life/core/data/data.dart';
import 'package:pure_life/core/exceptions/exceptions.dart';
import 'package:pure_life/core/exceptions/purelife_exception.dart';
import 'package:pure_life/core/network/api_endpoints.dart';

class ApiClient {
  ApiClient({required this.tokenRepository});
  Dio get _instance {
    final dioInstance = Dio(
      BaseOptions(receiveTimeout: const Duration(seconds: 60)),
    );
    dioInstance.options.connectTimeout = Duration(seconds: 30);
    dioInstance.options.receiveTimeout = Duration(seconds: 30);
    dioInstance.interceptors.addAll(
      [
        if (kDebugMode)
          LogInterceptor(
            responseBody: true,
            error: true,
            request: true,
            requestBody: true,
            requestHeader: true,
            responseHeader: true,
          ),
      ],
    );
    // fixBadCertificate(dio: dioInstance);
    return dioInstance;
  }

  final TokenRepository tokenRepository;

  String? getToken() {
    return tokenRepository.getToken().token;
  }

  void setAuth() {
    final token = getToken();
    if (token != null) {
      _instance.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<Either<PureLifeException, Response?>> call({
    required String path,
    required RequestMethod method,
    dynamic body = const {},
    Map<String, dynamic> queryParams = const {},
  }) async {
    setAuth();
    return await _instance.call(
        path: path, method: method, queryParams: queryParams, body: body);
  }
}

enum RequestMethod { get, post }

extension CallX on Dio {
  Future<Either<PureLifeException, Response?>> call({
    required String path,
    required RequestMethod method,
    dynamic body = const {},
    Map<String, dynamic> queryParams = const {},
  }) async {
    try {
      final response = await switch (method) {
        RequestMethod.get => get(
            path,
            queryParameters: queryParams,
          ),
        RequestMethod.post =>
          post(path, queryParameters: queryParams, data: body)
      };

      return Right(response);
    } on DioException catch (exception) {
      switch (exception.type) {
        case DioExceptionType.badResponse:
          final error =
              PureLifeException.fromErrorResponse(exception.response!);
          return Left(error);
        case _:
          return Left(ClientException(
              message: exception.message ?? 'An error occurred'));
      }
    } on Exception catch (e) {
      return Left(ClientException(message: e.toString()));
    }
  }
}
