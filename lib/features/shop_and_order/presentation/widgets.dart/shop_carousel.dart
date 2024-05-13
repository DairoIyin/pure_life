import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/container_properties.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/viewmodel/home_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopCarousel extends StatelessWidget {
  const ShopCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopScreenViewModel>(builder: (context, value, child) {
      return Visibility(
        visible: value.promoIsDisplayed,
        child: Column(
          children: [
            SizedBox(
              height: 161.h,
              child: PageView.builder(
                  controller: value.pageController,
                  itemCount: value.promos.length,
                  itemBuilder: (context, index) {
                    var item = value.promos[index];
                    return Container(
                        padding: EdgeInsets.only(left: 26.w),
                        height: 161.h,
                        decoration: BoxDecoration(
                          color: PureLifeColors.carouselGrey,
                          borderRadius: ContainerProperties.defaultBorderRadius,
                          border: Border.all(color: PureLifeColors.onPrimary,width: 3)
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: context.textTheme.bodyLarge,
                                ),
                                SizedBox(height: 13.h),
                                SizedBox(
                                  height: 31.h,
                                  width: 110.w,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      item.action,
                                      style: context.textTheme.bodySmall
                                          ?.copyWith(
                                              color: PureLifeColors.onPrimary),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Image(
                              image: AssetImage(AppImages.promo_img1),
                              width: 170.w,
                              height: 143.h,
                            )
                          ],
                        ));
                  }),
            ),
            SizedBox(height: 18.h),
            SmoothPageIndicator(
              controller: value.pageController,
              count: value.promos.length,
              effect: WormEffect(
                  activeDotColor: PureLifeColors.primaryText,
                  dotWidth: 7.w,
                  dotHeight: 7.w,
                  spacing: 5.6,
                  dotColor: PureLifeColors.onPrimary,
                  strokeWidth: 0.5),
            ),
            SizedBox(
              height: 14.h,
            ),
          ],
        ),
      );
    });
  }
}
