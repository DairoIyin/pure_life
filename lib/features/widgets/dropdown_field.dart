import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';

class DropdownField<T> extends StatelessWidget {
  DropdownField(
      {super.key,
      required this.controller,
      required this.title,
      this.bottomIsPadded = true,
      this.validator,
      this.errorString = '',
      required this.menuItems,
      this.showTitle = true,
      this.hintText = '',
      required this.onChanged,
      required this.displayField,
      required this.value});
  final List<T> menuItems;
  final TextEditingController controller;
  final String Function(T) displayField;
  final String title;
  String? Function(Object?)? validator;
  final bool bottomIsPadded;
  String? errorString;
  bool showTitle;
  String? hintText;
  void Function(T?)? onChanged;
  final T value;
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
        DropdownButtonFormField<T>(
          isExpanded: true,
          style: context.textTheme.labelMedium
              ?.copyWith(fontSize: 11.sp, color: PureLifeColors.secondaryText),
          dropdownColor: Colors.white,
          menuMaxHeight: 300.h,
          value: value,
          icon: SvgPicture.asset(AppIcons.arrow_downward,
              width: 7.w, height: 11.h),
          decoration: InputDecoration(
            filled: true,
            fillColor: PureLifeColors.onPrimary,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
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
          validator: validator,
          items: menuItems
              .map<DropdownMenuItem<T>>(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(displayField(item)),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
