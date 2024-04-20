import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';

class AddMedication extends StatelessWidget {
  const AddMedication({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      height: 64.h,
      decoration: const BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          color: PureLifeColors.onPrimary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Strings.addMoreMedication,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400)),
          SvgPicture.asset(
            AppIcons.add,
            width: 24.w,
            height: 24.h,
          )
        ],
      ),
    );
  }
}
