import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/themes/themes.dart';

class BorderlessTextField extends StatelessWidget {
  BorderlessTextField(
      {super.key,
      required this.controller,
      required this.title,
      this.bottomIsPadded = true,
      this.validator,
      this.errorString = '',
      this.showTitle = true,
      this.hintText = ''});
  final TextEditingController controller;
  final String title;
  String? Function(String?)? validator;
  final bool bottomIsPadded;
  bool showTitle;
  String? errorString;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showTitle
            ? Text(
                title,
                style: context.textTheme.labelMedium,
              )
            : SizedBox.shrink(),
        showTitle ? SizedBox(height: 11.84.h) : SizedBox.shrink(),
        TextFormField(
          controller: controller,
          style: context.textTheme.labelMedium
              ?.copyWith(fontSize: 11.sp, color: PureLifeColors.secondaryText),
          decoration: InputDecoration(
            filled: true,
            fillColor: PureLifeColors.onPrimary,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
            errorText: errorString,
            errorStyle: context.textTheme.labelMedium
                ?.copyWith(fontSize: 11.sp, color: PureLifeColors.primary),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
          ),
          cursorHeight: 18.h,
          cursorColor: PureLifeColors.lightGrey,
          validator: validator,
        ),
        // bottomIsPadded ? SizedBox(height: 16.16.h) : SizedBox.shrink()
      ],
    );
  }
}
