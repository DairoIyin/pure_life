import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:pure_life/core/routes/app_navigator.dart';
import 'package:pure_life/core/routes/path_names.dart';

import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/container_properties.dart';
import 'package:pure_life/core/ui_utils/extensions/routing_extension.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/presentation/widgets/widgets.dart';

class ShopCategory extends StatelessWidget {
  const ShopCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      decoration: const BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          color: PureLifeColors.onPrimary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(26.0.w, 22.h, 0.w, 18.h),
            child: Text(
              Strings.shopCategory,
              style: context.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6.0.w, 0.h, 26.w, 0.h),
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                CircleMenu(
                  icon: AppIcons.home_health,
                  onTap: () {
                    CustomNavigationHelper.router
                        .goNamed(AppPaths.shopAndOrderScreenName);
                    CustomNavigationHelper.router
                        .pushNamed(AppPaths.shopHealthScreenName);
                  },
                  title: Strings.shopHealth,
                ),
                CircleMenu(
                  icon: AppIcons.volunteer_activism,
                  onTap: () {
                    CustomNavigationHelper.router
                        .goNamed(AppPaths.shopAndOrderScreenName);
                    CustomNavigationHelper.router
                        .pushNamed(AppPaths.shopSkincareScreenName);
                  },
                  title: Strings.shopSkincare,
                ),
                CircleMenu(
                  icon: AppIcons.shopping_cart,
                  onTap: () {
                    CustomNavigationHelper.router
                        .goNamed(AppPaths.shopAndOrderScreenName);
                    CustomNavigationHelper.router
                        .pushNamed(AppPaths.supermarketScreenName);
                  },
                  title: Strings.superMarket,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TelehealthContainer extends StatelessWidget {
  const TelehealthContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.h,
      decoration: BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          color: PureLifeColors.onPrimary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(26.0.w, 32.h, 0.w, 18.h),
            child: Text(
              Strings.teleHealth,
              style: context.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6.0.w, 0.h, 26.w, 0.h),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                CircleMenu(
                  icon: AppIcons.pill,
                  onTap: () {

                    context.goNamed(AppPaths.drugRefillName);

                  },
                  title: Strings.drugRefill,
                ),
                CircleMenu(
                  icon: AppIcons.lab_test,
                  onTap: () {},
                  title: Strings.bookALabTest,
                ),
                CircleMenu(
                  icon: AppIcons.vaccination,
                  onTap: () {},
                  title: Strings.getVaccination,
                ),
                CircleMenu(
                  icon: AppIcons.stethoscope,
                  onTap: () {},
                  title: Strings.consultDoctor,
                ),
                CircleMenu(
                    icon: AppIcons.upload_prescription,
                    onTap: () {},
                    title: Strings.uploadPrescription),
              ],
            ),
          )
        ],
      ),
    );
  }
}
