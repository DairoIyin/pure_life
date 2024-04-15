import 'package:flutter/material.dart';
import 'package:pure_life/features/auth/presentation/forgotPassword/forgot_pswd_screen.dart';
import 'package:pure_life/features/auth/presentation/login/login.dart';
import 'package:pure_life/features/auth/presentation/onboarding/views/onboarding_screen.dart';
import 'package:pure_life/features/auth/presentation/signUp/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case AppRoutes.forgotPswdScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}

class AppRoutes{
  static const onboardingScreen='/';
  static const loginScreen='/login';
  static const signUpScreen='/signUp';
  static const forgotPswdScreen='/forgotPassword';
}
