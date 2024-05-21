import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/providers/product_provider.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';

import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/presentation/widgets/widgets.dart';
import 'package:pure_life/features/home/viewmodel/home_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/presentation/presentation/shop_and_order_screen.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopScreenViewModel>(context);
    return Consumer<HomeScreenViewModel>(builder: (context, value, child) {
      return SafeArea(
          child: ListView(
        padding: EdgeInsets.fromLTRB(16.0.w, 24.0.h, 16.0.w, 23.h),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: AssetImage(AppImages.pureLifeLogo),
                width: 73.w,
                height: 34.22.h,
              ),
              Spacer(),
              CircleIcon(
                icon: AppIcons.notification,
                onTap: () {},
              ),
              const SizedBox(width: 8.67),
              CircleIcon(
                icon: AppIcons.person,
                onTap: () {},
              ),
            ],
          ),

          Constants.largeVerticalGutter.verticalSpace,
          PureLifeSearchBar(hintText: Strings.searchPureLife),

          SizedBox(height: 18.h),
          const Carousel(),
          const TelehealthContainer(),
          SizedBox(height: 24.h),
          const ShopCategory(),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.shopAndOrder, style: context.textTheme.labelLarge),
              GestureDetector(
                  onTap: () {
                    context.goNamed(AppPaths.shopAndOrderScreenName);
                  },
                  child:
                      Text(Strings.seeAll, style: context.textTheme.bodyMedium))
            ],
          ),
          SizedBox(height: 24.h),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: shopProvider.productsList.isNotEmpty ? 4 : 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 15.w,
              ),
              itemBuilder: (context, index) {
      
                var product = shopProvider.productsList[index];
                return ShopItem(
                    product: product,);
              })
        ],
      ));
    });
  }
}
