import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/common_models/product.dart';
import 'package:pure_life/core/providers/product_provider.dart';
import 'package:pure_life/core/routes/path_names.dart';

import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/drug_refill/viewmodel/drug_refill_viewmodel.dart';
import 'package:pure_life/features/widgets/counter.dart';

import 'package:pure_life/features/widgets/widgets.dart';
import 'package:pure_life/injection.dart';

Future<void> showAboutProductDialog(
    BuildContext context, String productId) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => _AboutProductDialog(
      productId: productId,
    ),
  );
}

class _AboutProductDialog extends StatelessWidget {
  const _AboutProductDialog({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final product = productProvider.getProductById(productId);
    

    return Consumer<DrugRefillViewModel>(builder: (context, model, child) {
      return Dialog(
        surfaceTintColor: PureLifeColors.onPrimary,
        insetPadding: EdgeInsets.all(20.0),
        shape: const RoundedRectangleBorder(
            borderRadius: ContainerProperties.defaultBorderRadius),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(21.0, 32.0, 22.0, 54.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.aboutTheProduct,
                    style: context.textTheme.labelLarge,
                  ),
                  CircleCloseButon(
                    onTap: () =>
                        Navigator.of(context, rootNavigator: true).pop(),
                  )
                ],
              ),
              SizedBox(height: 24.h),
              _Info(context,
                  title: Strings.medication,
                  subTitle:
                      '${product?.title} ${product?.weight} *${product?.quantityInDrug}'),
              SizedBox(height: 24.h),
              _Info(context,
                  title: Strings.description,
                  subTitle: product?.description ?? 'Description'),
              SizedBox(height: 24.h),
              _Info(context,
                  title: Strings.productPrice,
                  subTitle: context.naira(product?.price ?? 0.00)),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.quantity,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Counter(quantity: 1)
                ],
              ),
              SizedBox(height: 35.h),
              PureLifeButton(
                onPressed: () {
                  model.addToSelectedDrugs(product!);
                  FocusScope.of(context).unfocus();
                  //model.searchController.clear();
                  Navigator.of(context, rootNavigator: true).pop();
                },
                title: Strings.add,
              )
            ],
          ),
        ),
      );
    });
  }
}

class _Info extends StatelessWidget {
  _Info(BuildContext context,
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Text(
            subTitle,
            textAlign: TextAlign.right,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
