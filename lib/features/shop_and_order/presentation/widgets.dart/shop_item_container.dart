import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/data/dto/product_response_dto.dart';
import 'package:pure_life/core/routes/app_navigator.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/extensions/memory_image_extension.dart';

import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/widgets/cart_snackbar.dart';

class ShopItemContainer extends StatefulWidget {
  const ShopItemContainer({
    super.key,
    required this.product,
  });
  final ProductItem product;

  @override
  State<ShopItemContainer> createState() => _ShopItemContainerState();
}

class _ShopItemContainerState extends State<ShopItemContainer> {
  @override
  Widget build(BuildContext context) {
    //final cartProvider = Provider.of<CartScreenViewModel>(context);
    return Consumer<CartScreenViewModel>(builder: (context, value, chid) {
      return Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                context.pushNamed(AppPaths.productDetailsName,
                    //path params have to be strings
                    pathParameters: {'id': widget.product.id.toString()});
              },
              child: Container(
                height: 157.h,
                decoration: BoxDecoration(
                    borderRadius: ContainerProperties.defaultBorderRadius,
                    border:
                        Border.all(color: PureLifeColors.onPrimary, width: 2),
                    image: DecorationImage(
                        image:
                            MemoryImage(widget.product.imageInBinary.toBytes),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Constants.smallVerticalGutter.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.product.name}',
                overflow: TextOverflow.ellipsis,
                style:
                    context.textTheme.labelMedium?.copyWith(fontSize: 9.4.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                context.naira(widget.product.price),
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
                      final alreadyInCart = snackBar(
                        context,
                        title: Strings.productAlreadyAddedToCart,
                      );
                      if (value.productIsInCart(productId: widget.product.id)) {
                        setState(() {
                          ScaffoldMessenger.maybeOf(context)
                              ?.showSnackBar(alreadyInCart);
                        });
                      }
                      CustomNavigationHelper.router
                          .goNamed(AppPaths.cartScreenName);
                      value.addToCart(productId: widget.product.id);
                    },
                  )),
                  SizedBox(width: 4.w),
                  Expanded(
                      child: _ShopButton(
                    text: Strings.addToCart,
                    bgColor: PureLifeColors.onPrimary,
                    textColor: PureLifeColors.primaryText,
                    onTap: () {
                      final alreadyInCart = snackBar(
                        context,
                        title: Strings.productAlreadyAddedToCart,
                      );
                      if (value.productIsInCart(productId: widget.product.id)) {
                        setState(() {
                          ScaffoldMessenger.maybeOf(context)
                              ?.showSnackBar(alreadyInCart);
                        });
                      }
                      CustomNavigationHelper.router
                          .goNamed(AppPaths.cartScreenName);
                      value.addToCart(productId: widget.product.id);
                    },
                  ))
                ],
              ),
            ],
          )
        ],
      );
    });
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
