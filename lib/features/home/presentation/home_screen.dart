import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/themes.dart';

import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/presentation/widgets/widgets.dart';
import 'package:pure_life/features/home/viewmodel/home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 49.78.h),
          PureLifeSearchBar(),
          SizedBox(height: 18.h),
          Carousel(),
          TelehealthContainer(),
          SizedBox(height: 24.h),
          ShopCategory(),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.shopAndOrder, style: context.textTheme.labelLarge),
              GestureDetector(
                  child:
                      Text(Strings.seeAll, style: context.textTheme.bodyMedium))
            ],
          ),
          SizedBox(height: 24.h),
          GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 15.w,
              ),
              children: [
                ShopItem(
                  title: value.shopItems[0].title,
                  amount: value.shopItems[0].amount,
                  image: value.shopItems[0].image,
                ),
                ShopItem(
                  title: value.shopItems[1].title,
                  amount: value.shopItems[1].amount,
                  image: value.shopItems[1].image,
                ),
                ShopItem(
                  title: value.shopItems[2].title,
                  amount: value.shopItems[2].amount,
                  image: value.shopItems[2].image,
                ),
                ShopItem(
                  title: value.shopItems[3].title,
                  amount: value.shopItems[3].amount,
                  image: value.shopItems[3].image,
                )
              ])
        ],
      ));
    });
  }
}
