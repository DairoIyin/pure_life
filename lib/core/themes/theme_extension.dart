import 'package:flutter/material.dart';

extension ThemeExtenion on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
  InputDecorationTheme get inputDecorationTheme => theme.inputDecorationTheme;
}
