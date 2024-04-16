import 'package:flutter/material.dart';
import 'package:pure_life/features/auth/presentation/forgotPassword/forgot_pswd_screen.dart';
import 'package:pure_life/features/auth/presentation/login/login_screen.dart';
import 'package:pure_life/features/auth/presentation/onboarding/views/onboarding_screen.dart';
import 'package:pure_life/features/auth/presentation/signUp/signup_screen.dart';
import 'package:pure_life/features/cart/presentation/cart_screen.dart';
import 'package:pure_life/features/dashboard/presentation/dashboard_screen.dart';
import 'package:pure_life/features/home/presentation/home_screen.dart';
import 'package:pure_life/features/profile/presentation/profile_screen.dart';
import 'package:pure_life/features/shop_and_order/presentation/presentation/shop_and_order.dart';
import 'package:pure_life/features/telehealth/presentation/telehealth_screen.dart';

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
      case AppRoutes.dashboardScreen:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.shopAndOrderScreen:
        return MaterialPageRoute(builder: (_) => ShopAndOrderScreen());
      case AppRoutes.telehealthScreen:
        return MaterialPageRoute(builder: (_) => TeleHealthScreen());
      case AppRoutes.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case AppRoutes.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

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
  static const dashboardScreen='/dashboard';
  static const homeScreen='/home';
  static const shopAndOrderScreen='/shopAndOrder';
  static const telehealthScreen='/telehealth';
  static const cartScreen='/cart';
  static const profileScreen='/profile';
}
