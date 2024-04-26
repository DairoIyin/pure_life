import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/auth/presentation/widgets/onboarding_header.dart';
import 'package:pure_life/features/auth/viewModels/forgot_pwd_screen_viewModel.dart';

import 'package:pure_life/features/widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordScreenViewModel>(
        builder: (context, value, child) {
      return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: PureLifeColors.scaffold,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: PureLifeColors.scaffold,
          body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.fromLTRB(19.0.w, 25.0.h, 17.0.w, 0.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const OnboardingHeader(
                    title: Strings.forgotPasswordHeader,
                  ),
                  SizedBox(height: 34.h),
                  TextInputField(
                    controller: value.enterPwd,
                    title: Strings.enterNewPassword,
                  ),
                  TextInputField(
                    controller: value.confirmPwd,
                    title: Strings.confirmPassword,
                  ),
                  SizedBox(height: 30.08.h),
                  PureLifeButton(
                      onPressed: () {
                        //pushNamedAndRemove
                      }, title: Strings.createNewPassword),
                ],
              ),
            )),
          ),
        ),
      );
    });
  }
}
