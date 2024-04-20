import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/widgets/pure_life_button.dart';

Future<void> showAboutProductDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const _AboutProductDialog(),
  );
}

class _AboutProductDialog extends StatelessWidget {
  const _AboutProductDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: PureLifeColors.onPrimary,
      insetPadding: EdgeInsets.all(20.0),
      shape: const RoundedRectangleBorder(
          borderRadius: ContainerProperties.defaultBorderRadius),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(21.0, 32.0, 22.0, 54.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.aboutTheProduct,
                  style: context.textTheme.labelLarge,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop;
                  },
                  child: SvgPicture.asset(
                    AppIcons.close,
                    width: 10.w,
                    height: 10.h,
                  ),
                )
              ],
            ),
            SizedBox(height: 24.h),
            _Info(context,
                title: Strings.medication,
                subTitle: 'Aspar Paracetamol 500mg *32caplets'),
            SizedBox(height: 24.h),
            _Info(context,
                title: Strings.description,
                subTitle: 'Aspar Paracetamol 500mg *32caplets'),
            SizedBox(height: 24.h),
            _Info(context, title: Strings.productPrice, subTitle: '₦700'),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          
                Text(
                  Strings.quantity,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                Container(
                    width: 51.w,
                    height: 39.h,
                    padding: EdgeInsets.all(10.56),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2.5.r)),
                        color: PureLifeColors.paleRed),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            child: Text(
                          '-',
                          style: TextStyle(fontSize: 10.72.sp),
                        )),
                        Text(
                          '1',
                          style: TextStyle(fontSize: 10.72.sp),
                        ),
                        InkWell(
                            child: Text(
                          '+',
                          style: TextStyle(fontSize: 10.72.sp),
                        )),
                      ],
                    )),
              ],
            ),
            SizedBox(height: 35.h),
            PureLifeButton(
              onPressed: () {},
              title: Strings.add,
            )
          ],
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  _Info(BuildContext context,
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Text(
            subTitle,
            textAlign: TextAlign.right,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
