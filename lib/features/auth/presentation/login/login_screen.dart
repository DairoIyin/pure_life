import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/routes/route_generator.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/theme_extension.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/core/utils/icons.dart';
import 'package:pure_life/core/utils/strings.dart';
import 'package:pure_life/features/auth/viewModels/login_screen_viewModel.dart';
import 'package:pure_life/features/widgets/back_button.dart';
import 'package:pure_life/features/widgets/password_text_field.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginScreenViewModel>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: PureLifeColors.scaffold,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.fromLTRB(19.0, 25.0, 17.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: PureLifeBackButton(
                    onTap: () => AppNavigator.pop(context),
                  ),
                ),
                SizedBox(height: 32.33.h),
                Center(
                  child: Text(
                    Strings.signIn,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                        color: PureLifeColors.primaryText),
                  ),
                ),
                SizedBox(height: 34.h),
                TextInputField(
                  controller: value.email,
                  title: Strings.emailAddress,
                ),
                PasswordTextField(
                  controller: value.password,
                  title: Strings.enterPassword,
                  bottomIsPadded: false,
                ),
                SizedBox(height: 18.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () =>
                        AppNavigator.push(context, AppRoutes.forgotPswdScreen),
                    child: const Text(
                      Strings.forgotPassword,
                    ),
                  ),
                ),
                SizedBox(height: 36.h),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          AppNavigator.pushReplacement(context,
                              routeName: AppRoutes.dashboardScreen);
                        },
                        child: const Text(Strings.signIn))),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        side: const BorderSide(
                            color: PureLifeColors.lightGrey, width: 2.0),
                        backgroundColor: PureLifeColors.onPrimary,
                        foregroundColor: PureLifeColors.primaryText),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.google,
                            height: 24.h,
                          ),
                          SizedBox(width: 16.w),
                          Text(Strings.signUpWithGoogle)
                        ]),
                  ),
                )
              ],
            ),
          )),
        ),
      );
    });
  }
}
