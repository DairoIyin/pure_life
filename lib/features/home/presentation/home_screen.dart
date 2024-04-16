import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/presentation/widgets/circle_icon.dart';
import 'package:pure_life/features/home/presentation/widgets/search_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      padding: EdgeInsets.fromLTRB(16.0.w, 24.0.h, 16.0.w, 0.h),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage(AppImages.pureLifeLogo),
              width: 73.w,
              height: 34.22.h,
            ),
            Spacer(),
            CircleIcon(
              icon: AppIcons.notification,
              onTap: () {},
            ),
            const SizedBox(width: 8.67),
            CircleIcon(
              icon: AppIcons.person,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 49.78.h),
        SearchIcon()
      ],
    ));
  }
}
