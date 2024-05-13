import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/providers/product_provider.dart';
import 'package:pure_life/core/routes/app_navigator.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    final shopScreenViewModel = Provider.of<ShopScreenViewModel>(context);
    final product = shopScreenViewModel.getProductById(int.parse(id));
    final decodedBinaryImage = base64Decode(product?.imageInBinary ?? '');
    return Consumer<CartScreenViewModel>(builder: (context, value, child) {
      return SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(16.0.w, 20.0.h, 16.0.w, 32.h),
          children: [
            PureLifeHeader(
              title: Strings.productDetails,
              onBackPressed: () {
                AppNavigator.pop(context);
              },
            ),
            Constants.mediumVerticalGutter.verticalSpace,
            Container(
              height: 304.h,
              decoration: BoxDecoration(
                  borderRadius: ContainerProperties.defaultBorderRadius,
                  border:
                      Border.all(color: PureLifeColors.onPrimary, width: 4.w),
                  image: DecorationImage(
                      //add placeholder image
                      image: MemoryImage(decodedBinaryImage),
                      fit: BoxFit.cover)),
            ),
            Constants.mediumVerticalGutter.verticalSpace,
            Text(product?.name ?? '', style: context.textTheme.bodyMedium),
            Constants.smallVerticalGutter.verticalSpace,
            Text(
              context.naira(product?.price ?? 0.0),
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: PureLifeColors.primary),
            ),
            Constants.largeVerticalGutter.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_Counter(), _DeleteBtn()],
            ),
            Constants.smallVerticalGutter.verticalSpace,
            SizedBox(
              height: 46.h,
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed(AppPaths.shopAndOrderScreenName);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  padding: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ).copyWith(
                  foregroundColor:
                      MaterialStatePropertyAll(PureLifeColors.primary),
                  backgroundColor:
                      MaterialStatePropertyAll(PureLifeColors.onPrimary),
                ),
                child: Text(
                  Strings.continueShopping,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Constants.mediumVerticalGutter.verticalSpace,
            OrderSummaryContainer(
                amount: (product?.price ?? 0.0 * product!.quantity),
                deliveryFee: 0.0,
                buttonTitle: Strings.continueShopping,
                action: () {
                  context.goNamed(AppPaths.shopAndOrderScreenName);
                })
          ],
        ),
      );
    });
  }
}

class _Counter extends StatefulWidget {
  _Counter({this.quantity = 1});
  int quantity;

  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 84.w,
        height: 46.h,
        padding: EdgeInsets.symmetric(horizontal: 10.56.w),
        decoration: BoxDecoration(
            borderRadius: ContainerProperties.defaultBorderRadius,
            color: PureLifeColors.buttonPink),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    widget.quantity--;
                  });
                },
                child: Text(
                  '-',
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
                )),
            Text(
              '${widget.quantity}',
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    widget.quantity++;
                  });
                },
                child: Text(
                  '+',
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
                )),
          ],
        ));
  }
}

class _DeleteBtn extends StatelessWidget {
  const _DeleteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(14.w),
        height: 46.h,
        decoration: const BoxDecoration(
            borderRadius: ContainerProperties.defaultBorderRadius,
            color: PureLifeColors.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AppIcons.delete,
              width: 16.w,
              height: 16.h,
              colorFilter:
                  ColorFilter.mode(PureLifeColors.primary, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
    ;
  }
}
