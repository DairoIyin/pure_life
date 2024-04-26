import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/widgets/pure_life_button.dart';

class OrderSummaryContainer extends StatelessWidget {
  const OrderSummaryContainer(
      {super.key,
      required this.amount,
      required this.deliveryFee,
      required this.buttonTitle,
      required this.action});
  final num amount;
  final num deliveryFee;
  final String buttonTitle;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.h,
      decoration: const BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          color: PureLifeColors.onPrimary),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 32.0, 20.0, 33.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.orderSummary,
              style: context.textTheme.labelLarge,
            ),
            Constants.largeVerticalGutter.verticalSpace,
            _Info(
              context,
              title: Strings.subtotal,
              subTitle: Text(
                context.naira(amount),
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 9.9.sp,
                    fontWeight: FontWeight.w700,
                    color: PureLifeColors.primaryText),
              ),
            ),
            Constants.mediumVerticalGutter.verticalSpace,
            Divider(),
            SizedBox(height: 14.h),
            _Info(context,
                title: Strings.discount,
                subTitle: Text(
                  Strings.applyCoupon,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: PureLifeColors.darkGrey,
                  ),
                  textAlign: TextAlign.right,
                )),
            SizedBox(height: 14.h),
            _Info(
              context,
              title: Strings.deliveryFee,
              subTitle: UnconstrainedBox(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 82.w,
                  height: 27.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 13.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      color: PureLifeColors.paleRed),
                  child: Text(
                    Strings.viewAddress,
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        color: PureLifeColors.primaryText),
                  ),
                ),
              ),
              weightIsBold: false,
            ),
            Constants.smallVerticalGutter.verticalSpace,
            Align(
              alignment: Alignment.bottomRight,
              child: Text(context.naira(deliveryFee),
                  style: TextStyle(
                      fontSize: 8.66.sp,
                      fontWeight: FontWeight.w500,
                      color: PureLifeColors.primaryText)),
            ),
            SizedBox(
              height: 13.84,
            ),
            Divider(),
            Constants.mediumVerticalGutter.verticalSpace,
            _Info(
              context,
              title: Strings.total,
              subTitle: Text(
                '$amount',
                style: TextStyle(
                    fontSize: 9.9.sp,
                    fontWeight: FontWeight.w700,
                    color: PureLifeColors.primaryText),
                textAlign: TextAlign.right,
              ),
              weightIsBold: false,
            ),
            Constants.largeVerticalGutter.verticalSpace,
            PureLifeButton(onPressed: action, title: buttonTitle)
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
      this.weightIsBold = true});
  final String title;
  final Widget subTitle;
  bool weightIsBold;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 11.14.sp,
                fontWeight: weightIsBold ? FontWeight.w600 : FontWeight.w300,
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
