import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';

class CircleCloseButon extends StatelessWidget {
  const CircleCloseButon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Container(
        padding: EdgeInsets.all(5.59.h),
        width: 24.w,
        height: 24.h,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: PureLifeColors.navbarGrey),
        child: Container(
            width: 6.75.w,
            height: 6.75.h,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppIcons.close,
              width: 6.75.w,
              height: 6.75.h,
            )),
      ),
    );
  }
}
