import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/data/dto/product_response_dto.dart';
import 'package:pure_life/core/routes/app_navigator.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/container_properties.dart';
import 'package:pure_life/core/ui_utils/extensions/memory_image_extension.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/home/presentation/widgets/add_to_cart_btn.dart';
import 'package:pure_life/features/widgets/cart_snackbar.dart';

class ShopItem extends StatefulWidget {
  const ShopItem(
      {super.key,
      required this.product});
  final ProductItem product;

  @override
  State<ShopItem> createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    // final decodedBinary = base64Decode(image);
    return Consumer<CartScreenViewModel>(
      builder: (context,value,child) {
        return Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  context.pushNamed(AppPaths.productDetailsName,
                    //path params have to be strings
                    pathParameters: {'id': widget.product.id.toString()});
                },
                child: Container(
                  height: 157.h,
                  decoration: BoxDecoration(
                      borderRadius: ContainerProperties.defaultBorderRadius,
                      image: DecorationImage(
                          image: MemoryImage(widget.product.imageInBinary.toBytes), fit: BoxFit.cover)),
                ),
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
                        widget.product.name,
                        overflow: TextOverflow.ellipsis,
                        style:
                            context.textTheme.labelLarge?.copyWith(fontSize: 11.sp),
                      ),
                      Text(
                        '${context.naira(widget.product.price)}',
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
                  onTap: () {
                    final alreadyInCart = snackBar(
                        context,
                        title: Strings.productAlreadyAddedToCart,
                      );
                      if (value.productIsInCart(productId: widget.product.id)) {
                        setState(() {
                          ScaffoldMessenger.maybeOf(context)
                              ?.showSnackBar(alreadyInCart);
                        });
                      }
                      value.addToCart(productId: widget.product.id);
                      CustomNavigationHelper.router
                          .goNamed(AppPaths.cartScreenName);
                      
                  },
                ))
              ],
            )
          ],
        );
      }
    );
  }
}
