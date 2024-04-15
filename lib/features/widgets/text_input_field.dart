import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/themes/themes.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {super.key,
      required this.controller,
      required this.title,
      this.bottomIsPadded = true});
  final TextEditingController controller;
  final String title;

  final bool bottomIsPadded;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.labelMedium,
        ),
        SizedBox(height: 11.84.h),
        TextField(
          controller: controller,
          style: context.textTheme.labelMedium
              ?.copyWith(fontSize: 11.sp, color: PureLifeColors.secondaryText),
          decoration: InputDecoration(
            filled: true,
            fillColor: PureLifeColors.onPrimary,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.w, color: PureLifeColors.lightGrey),
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.w, color: PureLifeColors.lightGrey),
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
          ),
          cursorHeight: 18.h,
          cursorColor: PureLifeColors.lightGrey,
        ),
        bottomIsPadded ? SizedBox(height: 16.16.h) : SizedBox.shrink()
      ],
    );
  }
}
