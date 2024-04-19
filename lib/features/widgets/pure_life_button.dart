import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';

class PureLifeButton extends StatelessWidget {
  const PureLifeButton(
      {super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46.0.h,
      child: ElevatedButton(onPressed: onPressed, child: Text(title)),
    );
  }
}
