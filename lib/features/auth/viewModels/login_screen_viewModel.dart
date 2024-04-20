import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/core/utils/disposable_change_notifier.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreenViewModel extends DisposableChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final fbKey = GlobalKey<FormState>();

  String? emailErrorText = '';
  String? pswdErrorText = '';

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      emailErrorText = 'Please enter an email address';
      notifyListeners();
    }
    if (!EmailValidator.validate(value!)) {
      emailErrorText = 'Enter a valid email address';
      notifyListeners();
    } else {
      return null;
    }
  }

  String? validatePswd(String? value) {
    if (value == null || value.isEmpty) {
      pswdErrorText = 'Please enter a password';
      notifyListeners();
    } else {
      return null;
    }
  }

  void submitForm(BuildContext context) {
    if (fbKey.currentState!.validate()) {
    
      context.goNamed(AppPaths.homeScreenName);
      notifyListeners();
    }
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
    email.dispose();
    password.dispose();
  }
}
