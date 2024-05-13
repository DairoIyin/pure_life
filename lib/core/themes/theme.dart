import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/ui_utils/container_properties.dart';

ThemeData pureLifeTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: TextTheme(
      headlineMedium: TextStyle(
          fontFamily: 'BricolageGrotesque',
          fontSize: 32.0.sp,
          fontWeight: FontWeight.w800,
          color: PureLifeColors.primaryText),
      headlineSmall:  TextStyle(
          fontFamily: 'BricolageGrotesque',
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w600,
          color: PureLifeColors.primaryText),
      bodySmall: TextStyle(
          fontFamily: 'BricolageGrotesque',
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w500,
          color: PureLifeColors.primaryText),
      bodyLarge: TextStyle(
          fontFamily: 'BricolageGrotesque',
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w600,
          color: PureLifeColors.primaryText),
      labelLarge: TextStyle(
          fontFamily: 'BricolageGrotesque',
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w600,
          color: PureLifeColors.primaryText),
      labelMedium: TextStyle(
          fontFamily: 'BricolageGrotesque',
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w400,
          color: PureLifeColors.primaryText),
      bodyMedium: TextStyle(
          fontFamily: 'BricolageGrotesque',
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w300,
          color: PureLifeColors.primaryText),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
       
        shape: const RoundedRectangleBorder(
          borderRadius: ContainerProperties.defaultButtonBorderRadius,
        ),
      ).copyWith(
        foregroundColor:
            const MaterialStatePropertyAll(PureLifeColors.onPrimary),
        backgroundColor: const MaterialStatePropertyAll(PureLifeColors.primary),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: PureLifeColors.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: PureLifeColors.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
    ));
