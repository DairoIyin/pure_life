import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/drug_refill/presentation/widgets/widgets.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 308.h,
      decoration: const BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          color: PureLifeColors.onPrimary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(26.0.w, 22.h, 0.w, 18.h),
            child: Text(
              Strings.searchResult,
              style: context.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0.w, 0.h, 26.w, 0.47.h),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ListTile(
                  onTap: () => showAboutProductDialog(context),
                  title: Text(
                    'Chlamydia IgM Ab',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: Container(
                    width: 38.49.w,
                    height: 38.44.h,
                    padding: EdgeInsets.all(10.56),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2.5.r)),
                        color: PureLifeColors.paleRed),
                    child: SvgPicture.asset(AppIcons.pill,
                        width: 16.w, height: 16.h),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Chlamydia IgM Ab',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: Container(
                    width: 38.49.w,
                    height: 38.44.h,
                    padding: EdgeInsets.all(10.56),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2.5.r)),
                        color: PureLifeColors.paleRed),
                    child: SvgPicture.asset(AppIcons.pill,
                        width: 16.w, height: 16.h),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Lokmal Qs-Tab',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: Container(
                    width: 38.49.w,
                    height: 38.44.h,
                    padding: EdgeInsets.all(10.56),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2.5.r)),
                        color: PureLifeColors.paleRed),
                    child: SvgPicture.asset(AppIcons.pill,
                        width: 16.w, height: 16.h),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Chlamydia IgM Ab',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: Container(
                    width: 38.49.w,
                    height: 38.44.h,
                    padding: EdgeInsets.all(10.56),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2.5.r)),
                        color: PureLifeColors.paleRed),
                    child: SvgPicture.asset(AppIcons.pill,
                        width: 16.w, height: 16.h),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
