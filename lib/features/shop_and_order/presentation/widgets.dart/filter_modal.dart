import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/enums/price_range.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff4d4d4d),
      child: Container(
        height: MediaQuery.of(context).size.height / 0.5,
        padding: EdgeInsets.fromLTRB(24.w, 43.h, 24.w, 0.h),
        decoration: const BoxDecoration(
            color: PureLifeColors.onPrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Strings.filterBy,
                    style:
                        context.textTheme.bodyLarge?.copyWith(fontSize: 20.sp)),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    AppIcons.close,
                    width: 14.w,
                    height: 14.h,
                  ),
                )
              ],
            ),
            Constants.largeVerticalGutter.verticalSpace,
            Text(Strings.price, style: context.textTheme.bodyLarge),
            Constants.smallVerticalGutter.verticalSpace,
            const _FilterTile(
                priceRangeType: PriceRange.below1, title: Strings.below1000),
            Constants.smallVerticalGutter.verticalSpace,
            const _FilterTile(
                priceRangeType: PriceRange.between1to3,
                title: Strings.between1kto),
            Constants.smallVerticalGutter.verticalSpace,
            const _FilterTile(
                priceRangeType: PriceRange.between3to4,
                title: Strings.between3kto),
            Constants.smallVerticalGutter.verticalSpace,
            const _FilterTile(
                priceRangeType: PriceRange.between4to5,
                title: Strings.between4kto),
            Constants.smallVerticalGutter.verticalSpace,
            const _FilterTile(
                priceRangeType: PriceRange.between5to9,
                title: Strings.between5kto),
            Constants.smallVerticalGutter.verticalSpace,
            const _FilterTile(
                priceRangeType: PriceRange.above10,
                title: Strings.between10kto),
            Constants.largeVerticalGutter.verticalSpace,
            SizedBox(
                height: 46.h,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(Strings.okay))),
            Constants.largeVerticalGutter.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _FilterTile extends StatelessWidget {
  const _FilterTile(
      {super.key, required this.priceRangeType, required this.title});
  final PriceRange priceRangeType;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Consumer<ShopScreenViewModel>(builder: (context, model, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
              activeColor: PureLifeColors.primary,
              focusColor: MaterialStateColor.resolveWith(
                  (states) => PureLifeColors.radioGrey),
              value: priceRangeType,
              groupValue: model.priceRange,
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (value) {
                model.onRadioChanged(value);
              }),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: context.textTheme.bodyLarge,
          )
        ],
      );
    });
  }
}
