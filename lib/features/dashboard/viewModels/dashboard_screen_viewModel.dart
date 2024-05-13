import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/utils/utils.dart';

class DashboardViewModel extends DisposableChangeNotifier {
  int selectedIndex = 0;

  void onTap(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
