import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pure_life/core/data/data.dart';

class AuthSessionStateManager extends ChangeNotifier {
  AuthSessionStateManager({required this.tokenRepository});

  final TokenRepository tokenRepository;

  AuthStatus authStatus = AuthStatus.unauthenticated;
  set setAuthStatus(AuthStatus status) {
    authStatus = status;
    notifyListeners();
  }

  bool firstTimeUser = true;
  set setfirstTimeUser(bool isFirstTimeuser) {
    firstTimeUser = isFirstTimeuser;
    notifyListeners();
  }

  User? currentUser;
  set setCurrentUser(User? currUser) {
    currentUser = currUser;
    notifyListeners();
  }

  AppToken currentToken = AppToken(token: null, user: null);
  set setCurrentToken(AppToken token) {
    currentToken = token;
    notifyListeners();
  }

  Future<void> init() async {
    currentToken = tokenRepository.getToken();

    if (currentUser != null) {
      firstTimeUser = false;
    }
    if (currentToken.token != null && currentToken.user != null) {
      authStatus = AuthStatus.authenticated;
    } else {
      authStatus = AuthStatus.unauthenticated;
    }
  }

  Future<void> logout() async {
    await tokenRepository.updateToken(currentToken.copyWithToken(null));
    await init();
  }
}

enum AuthStatus { authenticated, unauthenticated }
