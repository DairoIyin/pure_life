import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/container_properties.dart';
import 'package:pure_life/core/utils/utils.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //showModalBottomSheet(context: context, builder: builder);
      },
      child: FittedBox(
        child: Container(
          height: 48.h,
          padding: EdgeInsets.fromLTRB(5.w, 12.h, 9.w, 12.h),
          decoration: BoxDecoration(
              borderRadius: ContainerProperties.defaultBorderRadius,
              color: PureLifeColors.onPrimary),
          child: Row(
            children: [
              Text(Strings.filter, style: context.textTheme.labelMedium),
              SizedBox(width: 5.w),
              SvgPicture.asset(
                AppIcons.sort,
                width: 18.h,
                height: 12.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
