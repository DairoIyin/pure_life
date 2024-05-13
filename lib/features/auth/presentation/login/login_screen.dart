import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/utils/icons.dart';
import 'package:pure_life/core/utils/strings.dart';
import 'package:pure_life/features/auth/presentation/widgets/onboarding_header.dart';
import 'package:pure_life/features/auth/viewModels/login_screen_viewModel.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Consumer<LoginScreenViewModel>(builder: (context, model, child) {
      return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: PureLifeColors.scaffold,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Scaffold(
            backgroundColor: PureLifeColors.scaffold,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(19.0, 25.0, 17.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OnboardingHeader(title: Strings.signIn),
                    SizedBox(height: 34.h),
                    Form(
                      key: model.fbKey,
                      child: Column(
                        children: [
                          TextInputField(
                            controller: model.email,
                            title: Strings.emailAddress,
                            errorString: model.emailErrorText,
                            validator: _validateEmail,
                          ),
                          PasswordTextField(
                              controller: model.password,
                              title: Strings.enterPassword,
                              bottomIsPadded: false,
                              errorText: model.pswdErrorText,
                              validator: _validatePswd),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => context.goNamed(AppPaths.forgotPswdScreenName),
                        child: const Text(
                          Strings.forgotPassword,
                        ),
                      ),
                    ),
                    SizedBox(height: 36.h),
                    PureLifeButton(
                        onPressed: () {
                          // if (model.fbKey.currentState!.validate()) {
                          //   context.goNamed(AppPaths.homeScreenName);
                          // }
                          context.goNamed(AppPaths.homeScreenName);
                        },
                        title: Strings.signIn),
                    SizedBox(height: 16.h),
                    
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
