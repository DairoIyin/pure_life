import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:pure_life/core/exceptions/exceptions.dart';
import 'package:pure_life/core/utils/enums/status.dart';

typedef EitherExceptionOr<T> = Either<PureLifeException, T>;

Future<EitherExceptionOr<E>> processData<E>(
    E Function(dynamic data) transformer,
    EitherExceptionOr<Response?> response) async {
  if (response.isLeft) return Left(response.left);
return await compute<dynamic, EitherExceptionOr<E>>(
      (data) => _transformResponse(data, (d) => transformer(d)),
      response.right!.data);
  
}

EitherExceptionOr<E> _transformResponse<E>(
    dynamic data, E Function(dynamic) transform) {
  try {
    final json = data as Map<String, dynamic>;
     return Right(transform(json['result']));
    // switch ((json['status'] as String).status) {
    //   case Status.success:
    //     return Right(transform(json['data']));
    //   case Status.error:
    //     return Left(ServerException.fromJson(json));
    // }
  } on TypeError catch (e) {
    return Left(ObjectParseException(e.stackTrace));
  } on Exception catch (e) {
    return Left(ClientException(message: e.toString()));
  }
}
