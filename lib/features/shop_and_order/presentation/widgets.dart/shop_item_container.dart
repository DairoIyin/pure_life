import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/routes/app_navigator.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/container_properties.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/domain/models/models.dart';
import 'package:pure_life/features/home/presentation/widgets/add_to_cart_btn.dart';

class ShopItemContainer extends StatelessWidget {
  const ShopItemContainer({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              context.pushNamed(AppPaths.productDetailsName,
                  pathParameters: {'id': product.id});
            },
            child: Container(
              height: 157.h,
              decoration: BoxDecoration(
                  borderRadius: ContainerProperties.defaultBorderRadius,
                  border: Border.all(color: PureLifeColors.onPrimary, width: 2),
                  image: DecorationImage(
                      image: AssetImage(product.image), fit: BoxFit.cover)),
            ),
          ),
        ),
        Constants.smallVerticalGutter.verticalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${product.title} ${product.quantityInDrug}',
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelMedium?.copyWith(fontSize: 9.4.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              '${context.naira(product.price)}',
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: _ShopButton(
                  text: Strings.buyNow,
                  bgColor: PureLifeColors.buttonPink,
                  textColor: PureLifeColors.primaryText,
                  onTap: () {
                    CustomNavigationHelper.router
                        .pushNamed(AppPaths.cartScreenName);
                  },
                )),
                SizedBox(width: 4.w),
                Expanded(
                    child: _ShopButton(
                  text: Strings.addToCart,
                  bgColor: PureLifeColors.onPrimary,
                  textColor: PureLifeColors.primaryText,
                  onTap: () {
                    CustomNavigationHelper.router
                        .pushNamed(AppPaths.cartScreenName);
                  },
                ))
              ],
            ),
          ],
        )
      ],
    );
  }
}

class _ShopButton extends StatelessWidget {
  const _ShopButton(
      {super.key,
      required this.onTap,
      required this.textColor,
      required this.bgColor,
      required this.text});
  final VoidCallback onTap;
  final Color textColor;
  final Color bgColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: ContainerProperties.defaultSecondaryBorderRadius,
          ),
        ).copyWith(
          foregroundColor: MaterialStatePropertyAll(textColor),
          backgroundColor: MaterialStatePropertyAll(bgColor),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
