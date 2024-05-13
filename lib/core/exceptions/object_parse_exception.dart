import 'package:pure_life/core/exceptions/exceptions.dart';

final class ObjectParseException extends PureLifeException {
  const ObjectParseException(this.stackTrace);

  final StackTrace? stackTrace;

  @override
  String toString() =>
      'We encountered a problem trying to reach the server. We are working to fix it...';
}
