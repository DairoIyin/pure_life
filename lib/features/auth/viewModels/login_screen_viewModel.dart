import 'package:flutter/material.dart';
import 'package:pure_life/core/utils/disposable_change_notifier.dart';

class LoginScreenViewModel extends DisposableChangeNotifier{

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }


}