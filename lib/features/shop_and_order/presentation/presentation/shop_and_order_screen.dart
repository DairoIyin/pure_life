import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/providers/product_provider.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pure_life/core/utils/enums/category_enum.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/home/presentation/widgets/widgets.dart';
import 'package:pure_life/features/home/viewmodel/home_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/presentation/widgets.dart/widgets.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/features/widgets/widgets.dart';

//aka shop all
class ShopAndOrderScreen extends StatefulWidget {
  const ShopAndOrderScreen({super.key});

  @override
  State<ShopAndOrderScreen> createState() => _ShopAndOrderScreenState();
}

class _ShopAndOrderScreenState extends State<ShopAndOrderScreen> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ShopScreenViewModel>(builder: (context, value, child) {
      return SafeArea(
          child: ListView(
        controller: _scrollController,
        padding: EdgeInsets.fromLTRB(16.0.w, 20.0.h, 16.0.w, 23.h),
        children: [
          PureLifeHeader(
            title: Strings.shopAll,
            onBackPressed: () {
              context.goNamed(AppPaths.homeScreenName);
            },
          ),
          Constants.mediumVerticalGutter.verticalSpace,
          Row(
            children: [
              const Expanded(child: ShopSearchBar(title: Strings.searchAll)),
              SizedBox(width: 6.0.w),
              const FilterButton(),
            ],
          ),
          Constants.mediumVerticalGutter.verticalSpace,
          const ShopCarousel(),
          Constants.largeVerticalGutter.verticalSpace,
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: value.productsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 15.w,
              ),
              itemBuilder: (context, index) {
                var product = value.productsList[index];
                return ShopItemContainer(
                  product: product,
                );
              }),
          Constants.largeVerticalGutter.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Expanded(
                child: NumberPaginator(
                  numberPages: value.noOfPages,
                  onPageChange: (index) {
                    _scrollController.animateTo(0,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.linear);
                    value.onPageChanged(context, index, CategoryEnum.all);
                  },
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
