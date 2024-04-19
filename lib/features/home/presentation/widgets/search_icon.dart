import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';

class PureLifeSearchBar extends StatelessWidget {
  const PureLifeSearchBar({super.key});

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
          suffixIcon: Container(
            width: 21.92.w,
            height: 21.92.h,
            alignment: Alignment.center,
            child: SvgPicture.asset(AppIcons.search),
          )),
      cursorHeight: 18.h,
      cursorColor: PureLifeColors.lightGrey,
    );
  }
}
