import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/routes/app_navigator.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/widgets/pure_life_button.dart';

class SubscriptionBar extends StatefulWidget {
  SubscriptionBar({
    super.key,
  });

  @override
  State<SubscriptionBar> createState() => _SubscriptionBarState();
}

class _SubscriptionBarState extends State<SubscriptionBar> {
  SubscriptionType? _subscriptionType = SubscriptionType.monthly;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 206.h,
      decoration: const BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          color: PureLifeColors.onPrimary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(26.0.w, 22.h, 0.w, 16.h),
            child: Text(
              Strings.subscriptionPlan,
              style: context.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0.w, 0.h, 26.w, 0.47.h),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                        activeColor: PureLifeColors.primary,
                        value: SubscriptionType.monthly,
                        groupValue: _subscriptionType,
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          setState(() {
                            _subscriptionType = value;
                          });
                        }),
                    SizedBox(
                      width: 11.w,
                    ),
                    Text(
                      Strings.monthlySubscription,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                        activeColor: PureLifeColors.primary,
                        value: SubscriptionType.yearly,
                        groupValue: _subscriptionType,
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          setState(() {
                            _subscriptionType = value;
                          });
                        }),
                    SizedBox(
                      width: 11.w,
                    ),
                    Text(
                      Strings.yearlySubscription,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                PureLifeButton(
                  onPressed: () {
                    //pass radio option
                    CustomNavigationHelper.router
                        .pushNamed(AppPaths.cartScreenName);
                  },
                  title: Strings.subscribe,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
