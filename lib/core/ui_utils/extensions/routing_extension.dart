import 'package:flutter/material.dart';

class AppNavigator {
  static void push(BuildContext context, String route, {Object? arguments}) {
    Navigator.of(context).pushNamed(route, arguments: arguments);
  }

  static void pushReplacement(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static void popAllPush(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  static void pop(
    BuildContext context,
  ) {
    Navigator.of(context).pop();
  }
}
