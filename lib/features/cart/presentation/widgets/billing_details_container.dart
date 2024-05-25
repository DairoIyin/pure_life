import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/widgets/pure_life_button.dart';

class BillingDetailsContainer extends StatelessWidget {
  const BillingDetailsContainer(
      {super.key,
      required this.name,
      required this.email,
      required this.address,
      required this.phone});
  final String name;
  final String email;
  final String address;
  final String phone;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        color: PureLifeColors.primaryText);
    return Container(
      height: 208.h,
      decoration: const BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          color: PureLifeColors.onPrimary),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(27.51, 19.0, 24.49, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Info(
              context,
              title: Strings.billingDetails,
              subTitle: UnconstrainedBox(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 63.w,
                  height: 27.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 13.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      color: PureLifeColors.paleRed),
                  child: Center(
                    child: Row(children: [
                      Text(
                        Strings.edit,
                        style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                            color: PureLifeColors.primaryText),
                      ),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        AppIcons.edit,
                        width: 9.21.w,
                        height: 8.76.h,
                      )
                    ]),
                  ),
                ),
              ),
              isBold: true,
            ),
            SizedBox(height: 17.5.h),
            _Info(context,
                title: Strings.name,
                subTitle: Text(
                  name,
                  style: textStyle,
                  textAlign: TextAlign.right,
                )),
            SizedBox(height: 12.h),
            _Info(context,
                title: Strings.email,
                subTitle: Text(
                  email,
                  style: textStyle,
                  textAlign: TextAlign.right,
                )),
            SizedBox(height: 12.h),
            _Info(context,
                title: Strings.phoneNumber,
                subTitle: Text(
                  phone,
                  style: textStyle,
                  textAlign: TextAlign.right,
                )),
            SizedBox(height: 12.h),
            _Info(context,
                title: Strings.contactAddress,
                subTitle: Text(
                  address,
                  style: textStyle,
                  textAlign: TextAlign.right,
                )),
          ],
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  _Info(BuildContext context,
      {super.key,
      required this.title,
      required this.subTitle,
      this.isBold = false});
  final String title;
  final Widget subTitle;
  bool isBold;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: isBold ? 14.sp : 11.sp,
                fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
                color: PureLifeColors.primaryText),
          ),
        ),
        Expanded(
          child: subTitle,
        ),
      ],
    );
  }
}
