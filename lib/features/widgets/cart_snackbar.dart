  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';

SnackBar snackBar(context, {required String title}) {
    return SnackBar(
      backgroundColor: PureLifeColors.onPrimary,
      content: Row(
        children: [
          SvgPicture.asset(AppIcons.info, width: 24.w, height: 24.h),
          Constants.smallVerticalGutter.horizontalSpace,
          Text(
            title,
            style: TextStyle(color: PureLifeColors.primaryText),
          ),
        ],
      ),
    );
  }
