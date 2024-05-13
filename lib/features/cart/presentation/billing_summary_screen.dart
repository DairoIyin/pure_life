import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/presentation/widgets/billing_details_container.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class BillingSummaryScreen extends StatelessWidget {
  const BillingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopScreenViewModel = Provider.of<ShopScreenViewModel>(context);
    return Consumer<CartScreenViewModel>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: PureLifeColors.scaffold,
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.fromLTRB(16.0.w, 30.0.h, 16.0.w, 23.h),
          children: [
            PureLifeHeader(
              title: Strings.billingSummary,
              onBackPressed: () {
                AppNavigator.pop(context);
              },
            ),
            SizedBox(height: 29.h),
            const BillingDetailsContainer(
                name: 'Cecilia Obe',
                email: 'Cecilia.damsel@gmail.com',
                address: 'N/A',
                phone: '09034312743'),
            Constants.largeVerticalGutter.verticalSpace,
            OrderSummaryContainer(
              amount: value.getTotal(shopScreenViewModel),
              deliveryFee: 0.00,
              buttonTitle: Strings.placeOrder,
              action: () {},
            )
          ],
        )),
      );
    });
  }
}
