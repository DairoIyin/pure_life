import 'package:flutter/material.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackBar(String message) {
  final snackBar = SnackBar(
    elevation: 1,
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
    content: Text(
      message,
      style: TextStyle(color: PureLifeColors.primaryText),
    ),
    backgroundColor: PureLifeColors.paleRed,
    duration: Duration(seconds: 4),
  );
  snackbarKey.currentState?.showSnackBar(snackBar);
}
