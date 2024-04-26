import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/providers/product_provider.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/presentation/widgets/widgets.dart';
import 'package:pure_life/features/home/viewmodel/home_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/presentation/widgets.dart/widgets.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class ShopAndOrderScreen extends StatelessWidget {
  const ShopAndOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Consumer<ShopScreenViewModel>(builder: (context, value, child) {
      return SafeArea(
          child: ListView(
        padding: EdgeInsets.fromLTRB(16.0.w, 30.0.h, 16.0.w, 23.h),
        children: [
          PureLifeHeader(title: Strings.shopHealth),
          Constants.mediumVerticalGutter.verticalSpace,
          Row(
            children: [
              Expanded(child: ShopSearchBar()),
              SizedBox(width: 6.0.w),
              FilterButton(),
            ],
          ),
          Constants.mediumVerticalGutter.verticalSpace,
          const ShopCarousel(),
          Constants.largeVerticalGutter.verticalSpace,
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 15.w,
              ),
              itemBuilder: (context, index) {
                var product = productProvider.productList[index];
                return ShopItem(
                    image: product.image,
                    amount: product.price,
                    title: product.title);
              }),
          Constants.largeVerticalGutter.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Expanded(
                child: NumberPaginator(
                  numberPages: value.noOfPages,
                  onPageChange: (index) => value.onPageChanged(index),
                  showNextButton: false,
                  showPrevButton: false,
                  config: const NumberPaginatorUIConfig(
                    height: 25,

                    // default height is 48
                    contentPadding: EdgeInsets.zero,
                    buttonPadding: EdgeInsets.zero,
                    buttonSelectedForegroundColor: PureLifeColors.onPrimary,
                    buttonUnselectedForegroundColor: PureLifeColors.primaryText,
                    buttonUnselectedBackgroundColor: PureLifeColors.onPrimary,
                    buttonSelectedBackgroundColor: PureLifeColors.primary,
                  ),
                ),
              ),
              Spacer(),
            ],
          )
        ],
      ));
    });
  }
}
