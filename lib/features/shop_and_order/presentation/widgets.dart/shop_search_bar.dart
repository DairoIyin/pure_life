import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';

class ShopSearchBar extends StatelessWidget {
  const ShopSearchBar({super.key,required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.textTheme.labelMedium
          ?.copyWith(fontSize: 11.sp, color: PureLifeColors.secondaryText),
      decoration: InputDecoration(
          filled: true,
          fillColor: PureLifeColors.onPrimary,
          hintText: title,
          //hintStyle: TextStyle(color: PureLifeColors.onPrimary),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: ContainerProperties.defaultBorderRadius),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: ContainerProperties.defaultBorderRadius),
          prefixIcon: Container(
            width: 21.92.w,
            height: 21.92.h,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppIcons.search,
              color: PureLifeColors.grey,
            ),
          )),
      cursorHeight: 18.h,
      cursorColor: PureLifeColors.lightGrey,
    );
  }
}
