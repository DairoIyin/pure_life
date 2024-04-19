import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/routes/route_generator.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/auth/presentation/widgets/onboarding_header.dart';
import 'package:pure_life/features/auth/viewModels/signup_screen.dart';
import 'package:pure_life/features/widgets/password_text_field.dart';
import 'package:pure_life/features/widgets/pure_life_button.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? _validateName(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a name';
      }

      return null;
    }

    String? _validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter an email address';
      }
      if (!EmailValidator.validate(value)) {
        return 'Enter a valid email address';
      }
      return null;
    }

    String? _validatePswd(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a password';
      }

      return null;
    }

    return Consumer<SignupScreenViewModel>(builder: (context, value, child) {
      return Form(
        key: value.fbKey,
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: PureLifeColors.scaffold,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: PureLifeColors.scaffold,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(19.0, 25.0, 17.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OnboardingHeader(title: Strings.createAccount),
                    SizedBox(height: 34.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextInputField(
                            controller: value.fName,
                            title: Strings.firstName,
                            errorString: value.fNameErrorText,
                            validator: _validateName,
                          ),
                        ),
                        SizedBox(width: 15.0.w),
                        Expanded(
                          child: TextInputField(
                            controller: value.lName,
                            title: Strings.lastName,
                            errorString: value.lNameErrorText,
                            validator: _validateName,
                          ),
                        ),
                      ],
                    ),
                    TextInputField(
                      controller: value.email,
                      title: Strings.enterEmailAddress,
                      errorString: value.emailErrorText,
                      validator: _validateEmail,
                    ),
                    PasswordTextField(
                      controller: value.passWord,
                      title: Strings.enterPassword,
                      errorText: value.pswdErrorText,
                      validator: _validatePswd,
                    ),
                    PasswordTextField(
                      controller: value.confirmPassWord,
                      title: Strings.confirmPassword,
                      errorText: value.confirmPswdErrorText,
                      validator: _validatePswd,
                      bottomIsPadded: false,
                    ),
                    PureLifeButton(
                        onPressed: () {
                          if (value.fbKey.currentState!.validate()) {
                            AppNavigator.popAllPush(
                                context, AppRoutes.dashboardScreen);
                          }
                        },
                        title: Strings.createAccount),
                  ],
                ),
              )),
            ),
          ),
        ),
      );
    });
  }
}
