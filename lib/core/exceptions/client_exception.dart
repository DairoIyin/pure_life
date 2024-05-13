import 'dart:ffi';

import 'package:pure_life/core/exceptions/purelife_exception.dart';

final class ClientException extends PureLifeException {
  final String message;
 const ClientException({required this.message});

  @override
  String toString() => message;
}
