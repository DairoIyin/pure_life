import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/data/data.dart';
import 'package:pure_life/core/data/dto/dto.dart';
import 'package:pure_life/core/data/purelife_repository.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/core/ui_utils/snackbar.dart';
import 'package:pure_life/core/utils/disposable_change_notifier.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pure_life/core/utils/utils.dart';

class LoginScreenViewModel extends DisposableChangeNotifier {
  final PureLifeRepository repo;
  final TokenRepository tokenRepository;
  LoginScreenViewModel({required this.repo, required this.tokenRepository});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  num partnerId = -1;
  bool isLoggedIn = false;
  final fbKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? emailErrorText = '';
  String? pswdErrorText = '';
  String loginText = 'Login';

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

  void displayLoginMessage() {
    loginText = isLoading ? Strings.loggingYouIn : Strings.login;
    notifyListeners();
  }

  String? validatePswd(String? value) {
    if (value == null || value.isEmpty) {
      pswdErrorText = 'Please enter a password';
      notifyListeners();
    } else {
      return null;
    }
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    displayLoginMessage();
    final dto = LoginRequestDto(email: email.text, passWord: password.text);

    final response = await repo.login(dto);

    response.fold((left) {
      showSnackBar(left.toString());
    }, (right) {
      final res = LoginResponseDto.fromJson(
          response.right?.data as Map<String, dynamic>);

      tokenRepository.saveToken(res.token,
          User(email: email.text, name: '', partnerId: res.partnerId));

      print('partnerId: ${res.partnerId}');
      context.goNamed(AppPaths.homeScreenName);
      isLoading = false;
      notifyListeners();
    });
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
