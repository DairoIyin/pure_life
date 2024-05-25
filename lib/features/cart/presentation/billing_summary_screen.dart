import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/presentation/widgets/billing_details_container.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class BillingSummaryScreen extends StatefulWidget {
  const BillingSummaryScreen({super.key});

  @override
  State<BillingSummaryScreen> createState() => _BillingSummaryScreenState();
}

class _BillingSummaryScreenState extends State<BillingSummaryScreen> {
  var publicKey = 'pk_test_81cfbf5ed6f6de61a2753c9d1a068ca769eb6ca3';
  // final plugin = PaystackPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // plugin.initialize(publicKey: publicKey);
  }

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
            BillingDetailsContainer(
                name: value.fName.text,
                email: value.email.text,
                address: value.streetAddress.text,
                phone: value.phone.text),
            Constants.largeVerticalGutter.verticalSpace,
            OrderSummaryContainer(
              amount: value.getTotal(shopScreenViewModel),
              deliveryFee: 0.00,
              buttonTitle: Strings.placeOrder,
              action: () async {
                value.placeOrder();

                // CheckoutResponse response = await plugin.checkout(
                //   context,
                //   method: CheckoutMethod
                //       .card, // Defaults to CheckoutMethod.selectable
                //   charge: value.charge,
                // );
                // if (response.message == 'Success') {
                //   value.clearCart();
                //   context.pop();
                //   context.pop();
                //   context.goNamed(AppPaths.homeScreenName);
                // }
              },
            )
          ],
        )),
      );
    });
  }
}
