import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/auth/viewModels/signup_screen.dart';
import 'package:pure_life/features/widgets/password_text_field.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupScreenViewModel>(builder: (context, value, child) {
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
                    Strings.createAccount,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                        color: PureLifeColors.primaryText),
                  ),
                ),
                SizedBox(height: 34.h),
                Row(
                  children: [
                    Expanded(
                      child: TextInputField(
                        controller: value.fName,
                        title: Strings.firstName,
                      ),
                    ),
                    SizedBox(width: 15.0.w),
                    Expanded(
                      child: TextInputField(
                        controller: value.lName,
                        title: Strings.lastName,
                      ),
                    ),
                  ],
                ),
                TextInputField(
                  controller: value.email,
                  title: Strings.enterEmailAddress,
                ),
                PasswordTextField(
                  controller: value.passWord,
                  title: Strings.enterPassword,
                ),
                PasswordTextField(
                  controller: value.confirmPassWord,
                  title: Strings.confirmPassword,
                  bottomIsPadded: false,
                ),
                SizedBox(height: 48.h),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text(Strings.createAccount))),
              ],
            ),
          )),
        ),
      );
    });
  }
}
