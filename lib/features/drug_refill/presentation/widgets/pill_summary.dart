import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';

class PillSummary extends StatelessWidget {
  const PillSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      height: 80.h,
      decoration: const BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          color: PureLifeColors.onPrimary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5.59.h),
              width: 24.w,
              height: 24.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: PureLifeColors.onPrimary),
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
          ),
          SizedBox(width: 24.w),
          SvgPicture.asset(
            AppIcons.pill,
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Chlamydia IgM Ab',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400)),
                Text('500mg *32tablets',
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: PureLifeColors.secondaryText)),
              ],
            ),
          ),
          SizedBox(width: 70),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              AppIcons.arrow_forward,
              width: 7.83.w,
              height: 13.29.h,
            ),
          )
        ],
      ),
    );
    ;
  }
}
