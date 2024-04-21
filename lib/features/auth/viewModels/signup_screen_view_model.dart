import 'package:flutter/material.dart';
import 'package:pure_life/core/utils/utils.dart';

class SignupScreenViewModel extends DisposableChangeNotifier{

  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  final TextEditingController confirmPassWord = TextEditingController();

  final fbKey = GlobalKey<FormState>();

  String? fNameErrorText = '';
  String? lNameErrorText = '';
  String? emailErrorText = '';
  String? pswdErrorText = '';
  String? confirmPswdErrorText = '';
  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }


}