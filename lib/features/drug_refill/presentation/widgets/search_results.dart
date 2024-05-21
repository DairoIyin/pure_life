import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/providers/product_provider.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/drug_refill/presentation/widgets/widgets.dart';
import 'package:pure_life/features/drug_refill/viewmodel/drug_refill_viewmodel.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //alternative to consumer

    return Consumer<DrugRefillViewModel>(builder: (context, model, child) {
      return Container(
        decoration: const BoxDecoration(
            borderRadius: ContainerProperties.defaultBorderRadius,
            color: PureLifeColors.onPrimary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(26.0.w, 22.h, 0.w, 32.h),
              child: Text(
                Strings.searchResult,
                style: context.textTheme.labelLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0.w, 0.h, 26.w, 0.47.h),
              child: ListView.builder(
                itemCount: model.displayDrugList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (model.displayDrugList.isNotEmpty) {
                    return _ResultTile(
                      title: model.displayDrugList[index].title,
                      id: model.displayDrugList[index].id,
                    );
                  }
                  if (model.elementIsNotfound == true) {
                    return _NoResultsTile();
                  }
                },
              ),
            )
          ],
        ),
      );
    });
  }
}

class _ResultTile extends StatelessWidget {
  const _ResultTile({super.key, required this.title, required this.id});
  final String title;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Consumer<DrugRefillViewModel>(builder: (context, model, child) {
      return ListTile(
        //pass the product id to the on tappage
        onTap: () {
          final product=model.getProductById(id);
          showAboutProductDialog(
            context,product!
          );
        },
        title: Text(
          title,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        leading: Container(
          width: 38.49.w,
          height: 38.44.h,
          padding: EdgeInsets.all(10.56),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2.5.r)),
              color: PureLifeColors.paleRed),
          child: SvgPicture.asset(AppIcons.pill, width: 16.w, height: 16.h),
        ),
      );
    });
  }
}

class _NoResultsTile extends StatelessWidget {
  const _NoResultsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'No Results Found',
        style:
            context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
