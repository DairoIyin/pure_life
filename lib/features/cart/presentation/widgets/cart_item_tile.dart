import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/domain/models/cart_item.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/features/widgets/circle_close_btn.dart';
import 'package:pure_life/features/widgets/counter.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    required this.cartId,
    super.key,
  });
  final String cartId;
  @override
  Widget build(BuildContext context) {
    final cartProviderItem =
        Provider.of<CartScreenViewModel>(context).getCartItemById(cartId);

    final productProvider = Provider.of<ShopScreenViewModel>(context);
    final product = productProvider.getProductById(cartProviderItem!.productId);
    return product == null
        ? const SizedBox.shrink()
        : Consumer<CartScreenViewModel>(builder: (context, model, child) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              height: 94.h,
              decoration: const BoxDecoration(
                  borderRadius: ContainerProperties.defaultBorderRadius,
                  color: PureLifeColors.onPrimary),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleCloseButon(
                          onTap: () {
                            //Todo: implement removal from cart
                            model.removeFromCart(productId: product.id);
                          },
                        ),
                        SizedBox(width: 24.w),
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Container(
                            // width: 38.49.w,
                            // height: 38.49.h,
                            padding: const EdgeInsets.all(10.56),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.5.r)),
                                color: PureLifeColors.paleRed),
                            child: SvgPicture.asset(AppIcons.pill,
                                width: 16.w, height: 16.h),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(product.name,
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600)),
                              ),
                              Expanded(
                                child: Text(
                                    //todo: bring this back when description returns normal values from BE
                                    // product.description
                                    '',
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(
                                            color:
                                                PureLifeColors.secondaryText)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 70),
                        Text('',
                            style: TextStyle(
                                fontSize: 10.72.sp,
                                fontWeight: FontWeight.w400,
                                color: PureLifeColors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(context.naira(product.price),
                          style: TextStyle(
                              fontSize: 10.72.sp,
                              fontWeight: FontWeight.w400,
                              color: PureLifeColors.primaryText)),
                      SizedBox(width: 13.w),
                      Counter(
                        quantity: cartProviderItem.quantity,
                        productId: cartProviderItem.productId,
                      )
                    ],
                  ))
                ],
              ),
            );
          });
  }
}
