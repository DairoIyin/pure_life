import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/themes.dart';

class CircleMenu extends StatelessWidget {
  const CircleMenu(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title});
  final VoidCallback onTap;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15..h),
            width: 54.4.w,
            height: 54.4.h,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: PureLifeColors.scaffold),
            child: Container(
              width: 54.4.w,
              height: 54.4.h,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                icon,
                width: 22.0.w,
                height: 22.0.h,
              ),
            ),
          ),
          SizedBox(height: 10.6.h),
          Text(
            title,
            style: context.textTheme.labelMedium?.copyWith(letterSpacing: 0),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
