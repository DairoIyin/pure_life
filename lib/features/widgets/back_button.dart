import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/utils/icons.dart';

class PureLifeBackButton extends StatelessWidget {
  PureLifeBackButton({super.key, required this.onTap});
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.59.h),
        width: 34.67.w,
        height: 34.67.h,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: PureLifeColors.onPrimary),
        child: Container(
          width: 7.83.w,
          height: 13.29.h,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            AppIcons.arrow_backwards,
            width: 7.83.w,
            height: 13.29.h,
          ),
        ),
      ),
    );
  }
}
