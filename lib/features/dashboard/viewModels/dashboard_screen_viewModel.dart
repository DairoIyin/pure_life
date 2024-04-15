import 'package:flutter/material.dart';
import 'package:pure_life/core/utils/utils.dart';

class DashboardViewModel extends DisposableChangeNotifier {
  int index = 0;

  void onTap(int value) {
    index = value;
    notifyListeners();
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
