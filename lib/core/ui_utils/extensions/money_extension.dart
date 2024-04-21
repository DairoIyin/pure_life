import 'package:flutter/material.dart';
import 'package:pure_life/core/utils/utils.dart';

extension MoneyExtension on BuildContext {
  String naira(String val) {
    return '${Strings.naira}$val';
  }
}
