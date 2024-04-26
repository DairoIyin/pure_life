import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/drug_refill/presentation/widgets/widgets.dart';
import 'package:pure_life/features/drug_refill/viewmodel/drug_refill_viewmodel.dart';
import 'package:pure_life/features/widgets/pure_life_header.dart';

class DrugRefillScreen extends StatelessWidget {
  const DrugRefillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PureLifeColors.scaffold,
        body: Consumer<DrugRefillViewModel>(builder: (context, model, child) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SafeArea(
                child: ListView(
              padding: EdgeInsets.fromLTRB(16.0.w, 30.0.h, 16.0.w, 23.h),
              children: [
                PureLifeHeader(title: Strings.drugRefill),
                Constants.mediumVerticalGutter.verticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.info,
                      height: 16.h,
                      width: 16.h,
                    ),
                    SizedBox(width: 8),
                    Text(Strings.hintYouCanAdd,
                        style: context.textTheme.labelMedium
                            ?.copyWith(color: PureLifeColors.darkGrey))
                  ],
                ),
                SizedBox(height: 26.h),
                LabTestsSearchBar(),
                SizedBox(height: 12.h),
                model.displayDrugList.isEmpty
                    ? SizedBox.shrink()
                    : SearchResults(),
                SizedBox(height: 12.h),
                AddMedication(),
                SizedBox(height: 12.h),
                model.selectedDrugs.isEmpty
                    ? SizedBox.shrink()
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.selectedDrugs.length,
                        itemBuilder: (context, index) {
                          var product = model.selectedDrugs[index];
                          return PillSummary(
                            title: product.title,
                            quantityOfDrug: product.quantityInDrug,
                            weight: product.weight,
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 12.h,
                        ),
                      ),
                SizedBox(height: 12.h),
                SubscriptionBar()
              ],
            )),
          );
        }));
  }
}
