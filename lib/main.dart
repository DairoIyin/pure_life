import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/providers/product_provider.dart';
import 'package:pure_life/core/routes/app_navigator.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/utils/config.dart';
import 'package:pure_life/features/auth/viewModels/forgot_pwd_screen_viewModel.dart';
import 'package:pure_life/features/auth/viewModels/login_screen_viewModel.dart';
import 'package:pure_life/features/auth/viewModels/signup_screen_view_model.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/dashboard/viewModels/dashboard_screen_viewModel.dart';
import 'package:pure_life/features/drug_refill/viewmodel/drug_refill_viewmodel.dart';
import 'package:pure_life/features/home/viewmodel/home_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/presentation/presentation/shop_and_order_screen.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  AppConfig.init(environment: Environment.stage);
  CustomNavigationHelper.instance;
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
        ChangeNotifierProvider(create: (context) => DashboardViewModel()),
        ChangeNotifierProvider(create: (context) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (context) => DrugRefillViewModel()),
        ChangeNotifierProvider(
            create: (context) => CartScreenViewModel(getIt())),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(
            create: (context) => ShopScreenViewModel(getIt())),
        ChangeNotifierProvider(
            create: (context) => ForgotPasswordScreenViewModel())
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (_, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: pureLifeTheme,
              routerConfig: CustomNavigationHelper.router,
            );
          }),
    );
  }
}
