import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PureLifeBackButton(
          onTap: () => AppNavigator.pop(context),
        ),
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 22.sp,
              color: PureLifeColors.primaryText),
        ),
        SizedBox(width: 34.67.w)
      ],
    );
  }
}
