import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/icons.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key,
      required this.controller,
      required this.title,
      this.bottomIsPadded = true});
  final TextEditingController controller;
  final String title;
  final bool bottomIsPadded;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: context.textTheme.labelMedium,
        ),
        SizedBox(height: 11.84.h),
        TextField(
          controller: widget.controller,
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
              suffixIcon: GestureDetector(
                onTap: _togglePasswordVisibility,
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    _isObscured ? AppIcons.eye_off : AppIcons.eye_on,
                  ),
                ),
              )),
          cursorHeight: 18.h,
          obscureText: _isObscured,
          cursorColor: PureLifeColors.lightGrey,
        ),
        widget.bottomIsPadded ? SizedBox(height: 16.16.h) : SizedBox.shrink()
      ],
    );
  }
}
