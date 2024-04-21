import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/themes/themes.dart';

class Counter extends StatefulWidget {
  Counter({this.quantity = 1});
  int quantity;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 51.w,
        height: 39.h,
        padding: EdgeInsets.all(10.56),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.5.r)),
            color: PureLifeColors.paleRed),
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
                  style: TextStyle(fontSize: 10.72.sp),
                )),
            Text(
              '${widget.quantity}',
              style: TextStyle(fontSize: 10.72.sp),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    widget.quantity++;
                  });
                },
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 10.72.sp),
                )),
          ],
        ));
  }
}
