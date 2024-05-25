import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/extensions/delivery_name_extension.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/auth/presentation/widgets/onboarding_header.dart';
import 'package:pure_life/features/auth/viewModels/signup_screen_view_model.dart';
import 'package:pure_life/features/widgets/password_text_field.dart';
import 'package:pure_life/features/widgets/pure_life_button.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<SignupScreenViewModel>().getCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    String? _validateInput(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a value';
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
                            validator: _validateInput,
                          ),
                        ),
                        SizedBox(width: 15.0.w),
                        Expanded(
                          child: TextInputField(
                            controller: value.lName,
                            title: Strings.lastName,
                            errorString: value.lNameErrorText,
                            validator: _validateInput,
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
                    //country dropdown
                    DropDownWrapper(
                      title: Strings.country,
                      dropdown: DropdownButtonFormField(
                        isExpanded: true,
                        style: context.textTheme.labelMedium?.copyWith(
                            fontSize: 11.sp,
                            color: PureLifeColors.secondaryText),
                        dropdownColor: Colors.white,
                        menuMaxHeight: 300.h,
                        value: value.selectedCountry,
                        icon: SvgPicture.asset(AppIcons.arrow_downward,
                            width: 7.w, height: 11.h),
                        hint: Text(
                          Strings.selectYourCountry,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w400),
                        ),
                        decoration: dropDownDecoration(
                          context,
                        ),
                        validator: _validateInput,
                        items: value.countries
                            .map<DropdownMenuItem<String>>(
                              (item) => DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(item.name),
                              ),
                            )
                            .toList(),
                        onChanged: (item) {
                          value.selectedCountry = item ?? '';
                          value.countryId = value.getLocationIdByName(
                              value.countries, value.selectedCountry);
                          value.getStates();
                        },
                      ),
                    ),
                    SizedBox(height: 16.16.h),

                    //state dropdown
                    DropDownWrapper(
                      title: Strings.state,
                      dropdown: DropdownButtonFormField(
                        isExpanded: true,
                        style: context.textTheme.labelMedium?.copyWith(
                            fontSize: 11.sp,
                            color: PureLifeColors.secondaryText),
                        dropdownColor: Colors.white,
                        menuMaxHeight: 300.h,
                        value: value.selectedState,
                        icon: SvgPicture.asset(AppIcons.arrow_downward,
                            width: 7.w, height: 11.h),
                        hint: Text(
                          Strings.selectYourState,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w400),
                        ),
                        decoration: dropDownDecoration(
                          context,
                        ),
                        validator: _validateInput,
                        items: value.states
                            .map<DropdownMenuItem<String>>(
                              (item) => DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(item.name),
                              ),
                            )
                            .toList(),
                        onChanged: (item) {
                          value.selectedState = item ?? '';
                          value.stateId = value.getLocationIdByName(
                              value.states, value.selectedState);
                          value.getCities();
                        },
                      ),
                    ),
                    SizedBox(height: 16.16.h),
                    //city dropdown
                    DropDownWrapper(
                      title: Strings.city,
                      dropdown: DropdownButtonFormField(
                        isExpanded: true,
                        style: context.textTheme.labelMedium?.copyWith(
                            fontSize: 11.sp,
                            color: PureLifeColors.secondaryText),
                        dropdownColor: Colors.white,
                        menuMaxHeight: 300.h,
                        value: value.selectedArea,
                        icon: SvgPicture.asset(AppIcons.arrow_downward,
                            width: 7.w, height: 11.h),
                        hint: Text(
                          Strings.selectYourCity,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w400),
                        ),
                        decoration: dropDownDecoration(
                          context,
                        ),
                        validator: _validateInput,
                        items: value.areas
                            .map<DropdownMenuItem<String>>(
                              (item) => DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(item.name),
                              ),
                            )
                            .toList(),
                        onChanged: (item) {
                          value.selectedArea = item ?? '';
                          value.cityId = value.getLocationIdByName(
                              value.areas, value.selectedArea);
                         
                        },
                      ),
                    ),
                    SizedBox(height: 16.16.h),
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
                            context.goNamed(AppPaths.homeScreenName);
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

class DropDownWrapper extends StatelessWidget {
  const DropDownWrapper(
      {super.key, required this.title, required this.dropdown});
  final String title;
  final Widget dropdown;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.labelMedium),
        SizedBox(height: 11.84.h),
        dropdown
      ],
    );
  }
}
