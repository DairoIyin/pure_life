import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/auth/viewModels/forgot_pwd_screen_viewModel.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordScreenViewModel>(
        builder: (context, value, child) {
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
                    Strings.forgotPasswordHeader,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                        color: PureLifeColors.primaryText),
                  ),
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
                SizedBox(height: 50.08.h),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(Strings.createNewPassword))),
              ],
            ),
          )),
        ),
      );
    });
  }
}
