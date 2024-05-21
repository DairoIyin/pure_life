import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopScreenViewModel = Provider.of<ShopScreenViewModel>(context);
    return Consumer<CartScreenViewModel>(builder: (context, value, child) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: value.cartItems.isEmpty
            ? Scaffold(
                backgroundColor: PureLifeColors.scaffold,
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0.w, 20.0.h, 16.0.w, 23.h),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.empty_cart,
                            width: 100.w,
                            height: 100.h,
                            color: PureLifeColors.primaryText,
                          ),
                          Constants.largeVerticalGutter.verticalSpace,
                          Text(
                            Strings.thereIsNothingInYourCart,
                            style: context.textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: PureLifeColors.scaffold,
                body: SafeArea(
                    child: ListView(
                  padding: EdgeInsets.fromLTRB(16.0.w, 20.0.h, 16.0.w, 23.h),
                  children: [
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final cartItem =
                              value.cartItems.values.toList()[index];
                          return CartItemTile(cartId: cartItem.cartId);
                        },
                        separatorBuilder: (context, index) =>
                            Constants.smallVerticalGutter.verticalSpace,
                        itemCount: value.cartItems.length),
                    Constants.largeVerticalGutter.verticalSpace,
                    OrderSummaryContainer(
                      amount: value.getTotal(shopScreenViewModel),
                      deliveryFee: 0.00,
                      buttonTitle: Strings.checkout,
                      action: () {
                        context.goNamed(AppPaths.billingDetailsName);
                      },
                    )
                  ],
                )),
              ),
      );
    });
  }
}
