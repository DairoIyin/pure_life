import 'package:intl/intl.dart';

extension NumberFormatExtension on num {
  String get formattedWithDecimalPattern => NumberFormat.decimalPattern().format(this);
}