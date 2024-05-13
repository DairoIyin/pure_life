import 'package:pure_life/core/exceptions/purelife_exception.dart';

final class ServerException extends PureLifeException {
  final String message;
  final String error;
  const ServerException({required this.message, required this.error});
  
  factory ServerException.fromJson(Map<String, dynamic> json) =>
      ServerException(
          message: json['message'] ?? '', error: json['error'] ?? '');
  @override
  String toString() => message;
}
