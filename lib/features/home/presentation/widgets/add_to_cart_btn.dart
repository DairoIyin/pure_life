import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';

class AddToCartBtn extends StatelessWidget {
  const AddToCartBtn({super.key,required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 22.0.h,
        child: ElevatedButton(
          onPressed:onTap,
          child: Text(
            Strings.addToCart,
            style:
                TextStyle(fontFamily: 'Bricolage Grotesque', fontSize: 6.75.sp),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.22.r)),
              ),
              side: BorderSide(color: PureLifeColors.primaryText, width: 1.0),
              backgroundColor: PureLifeColors.onPrimary,
              foregroundColor: PureLifeColors.primaryText),
        ),
      ),
    );
  }
}
