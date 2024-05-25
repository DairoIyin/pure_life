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
import 'package:pure_life/features/shop_and_order/presentation/widgets.dart/widgets.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class ShopHealthScreen extends StatefulWidget {
  const ShopHealthScreen({super.key});

  @override
  State<ShopHealthScreen> createState() => _ShopHealthScreenState();
}

class _ShopHealthScreenState extends State<ShopHealthScreen> {
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
            title: Strings.shopHealth,
            onBackPressed: () {
              context.goNamed(AppPaths.homeScreenName);
            },
          ),
          Constants.mediumVerticalGutter.verticalSpace,
          Row(
            children: [
              const Expanded(
                  child: ShopSearchBar(title: Strings.searchShopHealth)),
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
      
        ],
      ));
    });
  }
}
