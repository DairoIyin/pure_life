import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class BillingDetails extends StatelessWidget {
  const BillingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartScreenViewModel>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: PureLifeColors.scaffold,
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.fromLTRB(16.0.w, 30.0.h, 16.0.w, 23.h),
          children: [
            PureLifeHeader(title: Strings.billingDetails),
            SizedBox(height: 42.h),
            Text(
              Strings.addDeliveryAddress,
              style: context.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 38.h),
            Row(
              children: [
                Expanded(
                  child: TextInputField(
                    controller: value.fName,
                    title: Strings.firstName,
                    errorString: value.fNameErrorText,
                    // validator: _validateName,
                  ),
                ),
                SizedBox(width: 15.0.w),
                Expanded(
                  child: TextInputField(
                    controller: value.lName,
                    title: Strings.lastName,
                    errorString: value.lNameErrorText,
                    // validator: _validateName,
                  ),
                ),
              ],
            ),
          ],
        )),
      );
    });
  }
}
