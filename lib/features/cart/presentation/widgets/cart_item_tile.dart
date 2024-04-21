import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/widgets/circle_close_btn.dart';
import 'package:pure_life/features/widgets/counter.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile(
      {super.key,
      required this.amount,
      required this.description,
      required this.quantity,
      required this.title,
      required this.weight});
  final String title;
  final String description;
  final String weight;
  final String amount;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      height: 94.h,
      decoration: const BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          color: PureLifeColors.onPrimary),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleCloseButon(),
                SizedBox(width: 24.w),
                Container(
                  width: 38.49.w,
                  height: 38.44.h,
                  padding: EdgeInsets.all(10.56),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.5.r)),
                      color: PureLifeColors.paleRed),
                  child: SvgPicture.asset(AppIcons.pill,
                      width: 16.w, height: 16.h),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(title,
                            style: context.textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w600)),
                      ),
                      Expanded(
                        child: Text(description,
                            style: context.textTheme.bodySmall?.copyWith(
                                color: PureLifeColors.secondaryText)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 70),
                Text(weight,
                    style: TextStyle(
                        fontSize: 10.72.sp,
                        fontWeight: FontWeight.w400,
                        color: PureLifeColors.black)),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(context.naira(amount),
                  style: TextStyle(
                      fontSize: 10.72.sp,
                      fontWeight: FontWeight.w400,
                      color: PureLifeColors.primaryText)),
              SizedBox(width: 13.w),
              Counter(quantity: quantity)
            ],
          ))
        ],
      ),
    );
  }
}
