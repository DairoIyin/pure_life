import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/routes/route_generator.dart';
import 'package:pure_life/core/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/features/auth/viewModels/forgot_pwd_screen_viewModel.dart';
import 'package:pure_life/features/auth/viewModels/login_screen_viewModel.dart';
import 'package:pure_life/features/auth/viewModels/signup_screen.dart';

void main() {
  runApp(const PureLifeApp());
}

class PureLifeApp extends StatelessWidget {
  const PureLifeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginScreenViewModel()),
        ChangeNotifierProvider(create: (context) => SignupScreenViewModel()),
        ChangeNotifierProvider(
            create: (context) => ForgotPasswordScreenViewModel())
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: pureLifeTheme,
              initialRoute: AppRoutes.onboardingScreen,
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          }),
    );
  }
}
