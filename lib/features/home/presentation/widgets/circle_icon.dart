import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/themes.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.icon, required this.onTap});
  final VoidCallback onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5.59.h),
        width: 34.67.w,
        height: 34.67.h,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: PureLifeColors.onPrimary),
        child: Container(
          width: 24.0.w,
          height: 24.0.h,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            icon,
            width: 24.0.w,
            height: 24.0.h,
          ),
        ),
      ),
    );
  }
}