import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class PureLifeHeader extends StatelessWidget {
  const PureLifeHeader({super.key, required this.title,required this.onBackPressed});
  final String title;
  final VoidCallback onBackPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PureLifeBackButton(
          onTap: onBackPressed
        ),
        Text(title, style: context.textTheme.bodyLarge),
        SizedBox(width: 34.67.w)
      ],
    );
  }
}
