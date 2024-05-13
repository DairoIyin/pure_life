import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/drug_refill/viewmodel/drug_refill_viewmodel.dart';
import 'package:pure_life/features/widgets/circle_close_btn.dart';

class PillSummary extends StatelessWidget {
  PillSummary(
      {super.key, required this.title, this.quantityOfDrug, this.weight});
  String title;
  String? weight;
  String? quantityOfDrug;
  @override
  Widget build(BuildContext context) {
    return Consumer<DrugRefillViewModel>(builder: (context, model, child) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        height: 80.h,
        decoration: const BoxDecoration(
            borderRadius: ContainerProperties.defaultBorderRadius,
            color: PureLifeColors.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleCloseButon(
              onTap: () => model.removeSelectedDrug(title),
            ),
            SizedBox(width: 24.w),
            SvgPicture.asset(
              AppIcons.pill,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400)),
                Text('${weight ?? ''} *${quantityOfDrug ?? ''}',
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: PureLifeColors.secondaryText)),
              ],
            ),
            SizedBox(width: 70),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                AppIcons.arrow_forward,
                width: 7.83.w,
                height: 13.29.h,
              ),
            )
          ],
        ),
      );
    });
    ;
  }
}
