import 'package:flutter/material.dart';
import 'package:pure_life/core/utils/utils.dart';

class ForgotPasswordScreenViewModel extends DisposableChangeNotifier{

  final TextEditingController enterPwd = TextEditingController();
  final TextEditingController confirmPwd = TextEditingController();

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }


}