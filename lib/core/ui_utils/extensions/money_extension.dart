import 'package:flutter/material.dart';
import 'package:pure_life/core/ui_utils/extensions/number_formatter.dart';
import 'package:pure_life/core/utils/utils.dart';

extension MoneyExtension on BuildContext {
  String naira(num val) {
    return '${Strings.naira}${val.formattedWithDecimalPattern}';
  }
}
