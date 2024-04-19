import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/routes/route_generator.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/core/utils/icons.dart';
import 'package:pure_life/core/utils/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/utils/strings.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/features/widgets/pure_life_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: PureLifeColors.onPrimary,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: PureLifeColors.onPrimary,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.fromLTRB(15.0, 42.0, 20.0, 61.0),
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: AssetImage(AppImages.pureLifeLogo),
                    width: 144.w,
                    height: 67.5.h,
                  )),
              SizedBox(
                height: 55.h,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 234.63.w,
                      height: 251.h,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(9.92.r)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                PureLifeColors.paleRed,
                                PureLifeColors.onPrimary
                              ])),
                    ),
                  ),
                  Positioned(
                    top: 14.88.h,
                    left: 22.w,
                    child: Image(
                        image: AssetImage(AppImages.promo_img1),
                        width: 314.0.w,
                        height: 236.h),
                  ),
                  Positioned(
                      left: 70.72.w,
                      bottom: 63.93.h,
                      child: _InfoItem(
                        icon: AppIcons.vaccination,
                        title: Strings.teleHealth,
                      )),
                  Positioned(
                      right: 70.47.w,
                      bottom: 16.31.h,
                      child: _InfoItem(
                        icon: AppIcons.shopping_cart,
                        title: Strings.shopAndOrder,
                      ))
                ],
              ),
              SizedBox(height: 46.h),
              Text(
                Strings.yourOneStopForWellnessAndLifestyle,
                style: context.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Text(
                Strings.shopScheduleVaccinationAppointments,
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: PureLifeColors.secondaryText),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35.h),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 46.0,
                      child: PureLifeButton(
                          onPressed: () => AppNavigator.push(
                              context, AppRoutes.signUpScreen),
                          title: Strings.createAccount),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: SizedBox(
                      height: 46.0.h,
                      child: ElevatedButton(
                        onPressed: () =>
                            AppNavigator.push(context, AppRoutes.loginScreen),
                        child: Text(Strings.signIn),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            side: BorderSide(
                                color: PureLifeColors.lightGrey, width: 2.0),
                            backgroundColor: PureLifeColors.onPrimary,
                            foregroundColor: PureLifeColors.primaryText),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.icon,
    required this.title,
    super.key,
  });
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(6.64.w, 3.57.h, 6.72.w, 4.16.h),
      decoration: BoxDecoration(
          color: PureLifeColors.onPrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(2.97.r),
          ),
          boxShadow: [
            BoxShadow(
              color: PureLifeColors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 2.97,
              offset: Offset(2.97, 2.97), // changes position of shadow
            ),
          ]),
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(5.59.h),
          width: 22.59.w,
          height: 22.59.h,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xffFFF7F8)),
          child: SvgPicture.asset(
            icon,
            height: 11.8.h,
          ),
        ),
        SizedBox(width: 4.76),
        Text(
          title,
          style: context.textTheme.bodySmall
              ?.copyWith(fontSize: 5.94, fontWeight: FontWeight.w800),
        )
      ]),
    );
  }
}
