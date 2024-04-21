import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartScreenViewModel>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: PureLifeColors.scaffold,
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.fromLTRB(16.0.w, 30.0.h, 16.0.w, 23.h),
          children: [
            PureLifeHeader(title: Strings.yourCart),
            SizedBox(height: 29.h),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final cartItem = value.cartItems[index];
                  return CartItemTile(
                      amount: cartItem.amount,
                      description: cartItem.description,
                      quantity: cartItem.quantity,
                      title: cartItem.title,
                      weight: cartItem.weight);
                },
                separatorBuilder: (context, index) =>
                    Constants.smallVerticalGutter.verticalSpace,
                itemCount: value.cartItems.length),
            Constants.largeVerticalGutter.verticalSpace,
            OrderSummaryContainer(
              amount: '89,250.00',
              deliveryFee: '0.00',
            )
          ],
        )),
      );
    });
  }
}
