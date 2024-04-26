import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/drug_refill/viewmodel/drug_refill_viewmodel.dart';

class LabTestsSearchBar extends StatelessWidget {
  const LabTestsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DrugRefillViewModel>(builder: (context, model, child) {
      return TextField(
        controller: model.searchController,
        focusNode: model.searchFocusNode,
        style: context.textTheme.labelMedium
            ?.copyWith(fontSize: 11.sp, color: PureLifeColors.secondaryText),
        decoration: InputDecoration(
            filled: true,
            fillColor: PureLifeColors.onPrimary,
            hintText: Strings.searchPureLife,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6.65.r))),
            prefixIcon: Container(
              width: 17.w,
              height: 17.h,
              alignment: Alignment.center,
              child: SvgPicture.asset(AppIcons.search),
            ),
            suffixIcon: InkWell(
              onTap: () {
                model.searchController.clear();
              },
              child: Container(
                width: 7.83.w,
                height: 13.29.h,
                alignment: Alignment.center,
                child: SvgPicture.asset(AppIcons.close),
              ),
            )),
        cursorHeight: 18.h,
        cursorColor: PureLifeColors.lightGrey,
        onChanged: (value) {
          model.searchList(value);
        },
      );
    });
  }
}
