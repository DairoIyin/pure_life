import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/container_properties.dart';
import 'package:pure_life/features/dashboard/viewModels/dashboard_screen_viewModel.dart';

class PureLifeBottomNavItem extends StatelessWidget {
  const PureLifeBottomNavItem(
      {super.key, required this.icon, required this.title});
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PureLifeBottomNavBar extends StatefulWidget {
  PureLifeBottomNavBar(
      {super.key, required this.items, required this.navShell});
  final List<PureLifeBottomNavItem> items;
  final StatefulNavigationShell navShell;

  @override
  State<PureLifeBottomNavBar> createState() => _PureLifeBottomNavBarState();
}

class _PureLifeBottomNavBarState extends State<PureLifeBottomNavBar> {
  // void _goToBranch(int index) {

  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(builder: (context, value, child) {
      return Container(
        padding: EdgeInsets.fromLTRB(27.0.w, 12.0.h, 27.0.w, 11.0.h),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: PureLifeColors.navbarGrey,
            borderRadius: ContainerProperties.defaultBorderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              widget.items.length,
              (index) => PureLifeBottomNavTile(
                    icon: widget.items[index].icon,
                    title: widget.items[index].title,
                    isSelected: widget.navShell.currentIndex == index,
                    onTap: () {
                      HapticFeedback.lightImpact();
                      //   value.onTap(index);
                      widget.navShell.goBranch(index,
                          initialLocation:
                              index == widget.navShell.currentIndex);
                      setState(() {});
                      // _goToBranch(index);
                    },
                  )),
        ),
      );
    });
  }
}

class PureLifeBottomNavTile extends StatelessWidget {
  const PureLifeBottomNavTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.isSelected = false});
  final String icon;
  final String title;

  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final itemColor = isSelected ? PureLifeColors.primary : PureLifeColors.grey;
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 14.w,
              height: 14.h,
              colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
            ),
            SizedBox(height: 5.33),
            Text(
              title,
              style: TextStyle(fontSize: 10.sp, color: itemColor),
            )
          ],
        ),
      ),
    );
  }
}
