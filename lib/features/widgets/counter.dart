import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';

class Counter extends StatefulWidget {
  Counter({required this.quantity, required this.productId});
  final num quantity;
  final num productId;
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartScreenViewModel>(builder: (context, value, child) {
      return Container(
          width: 51.w,
          height: 39.h,
          padding: EdgeInsets.symmetric(horizontal: 10.56.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2.5.r)),
              color: PureLifeColors.paleRed),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    value.decrementCartItem(
                        productId: widget.productId, quantity: widget.quantity);
                  },
                  child: Text(
                    '-',
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  )),
              Text(
                '${widget.quantity}',
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
              ),
              InkWell(
                  onTap: () {
                    value.incrementCartItem(
                        productId: widget.productId, quantity: widget.quantity);
                  },
                  child: Text(
                    '+',
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  )),
            ],
          ));
    });
  }
}
