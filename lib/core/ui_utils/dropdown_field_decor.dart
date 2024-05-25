import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/themes/themes.dart';


InputDecoration dropDownDecoration(BuildContext context) {
  return InputDecoration(
            filled: true,
            fillColor: PureLifeColors.onPrimary,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
          
            errorStyle: context.textTheme.labelMedium
                ?.copyWith(fontSize: 11.sp, color: PureLifeColors.primary),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.w, color: PureLifeColors.lightGrey),
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.w, color: PureLifeColors.lightGrey),
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.w, color: PureLifeColors.lightGrey),
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.w, color: PureLifeColors.lightGrey),
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
          );
}
