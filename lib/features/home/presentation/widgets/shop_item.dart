import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/container_properties.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/features/home/presentation/widgets/add_to_cart_btn.dart';

class ShopItem extends StatelessWidget {
  const ShopItem(
      {super.key,
      required this.image,
      required this.amount,
      required this.title});
  final String image;
  final String title;
  final num amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 157.h,
            decoration: BoxDecoration(
                borderRadius: ContainerProperties.defaultBorderRadius,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style:
                        context.textTheme.labelLarge?.copyWith(fontSize: 11.sp),
                  ),
                  Text(
                    '${context.naira(amount)}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                        color: PureLifeColors.secondaryText,
                        letterSpacing: 0),
                  )
                ],
              ),
            ),
            Expanded(
                child: AddToCartBtn(
              onTap: () {},
            ))
          ],
        )
      ],
    );
  }
}
