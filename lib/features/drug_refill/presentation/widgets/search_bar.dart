import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';

class LabTestsSearchBar extends StatelessWidget {
  const LabTestsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.textTheme.labelMedium
          ?.copyWith(fontSize: 11.sp, color: PureLifeColors.secondaryText),
      decoration: InputDecoration(
          filled: true,
          fillColor: PureLifeColors.onPrimary,
          hintText: Strings.searchPureLife,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
          prefixIcon: Container(
            width: 17.w,
            height: 17.h,
            alignment: Alignment.center,
            child: SvgPicture.asset(AppIcons.search),
          ),
          suffixIcon: Container(
            width: 7.83.w,
            height: 13.29.h,
            alignment: Alignment.center,
            child: SvgPicture.asset(AppIcons.arrow_downward),
          )),
      cursorHeight: 18.h,
      cursorColor: PureLifeColors.lightGrey,
    );
  }
}
