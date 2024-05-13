import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/themes/pure_life_colors.dart';
import 'package:pure_life/core/ui_utils/container_properties.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/presentation/cart_screen.dart';
import 'package:pure_life/features/dashboard/presentation/widgets/bottom_nav_bar.dart';
import 'package:pure_life/features/dashboard/viewModels/dashboard_screen_viewModel.dart';
import 'package:pure_life/features/home/presentation/home_screen.dart';
import 'package:pure_life/features/profile/presentation/profile_screen.dart';
import 'package:pure_life/features/shop_and_order/presentation/presentation/shop_and_order_screen.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/features/telehealth/presentation/telehealth_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.navShell});
  final StatefulNavigationShell navShell;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ShopScreenViewModel>(context, listen: false).getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: PureLifeColors.scaffold,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: widget.navShell,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(16.0.w, 12.0.h, 16.0.w, 25.0.h),
          child: PureLifeBottomNavBar(
            navShell: widget.navShell,
            items: [
              PureLifeBottomNavItem(icon: AppIcons.home, title: Strings.home),
              PureLifeBottomNavItem(
                  icon: AppIcons.transactions, title: Strings.shopAndOrder),
              PureLifeBottomNavItem(
                  icon: AppIcons.home_health, title: Strings.teleHealth),
              PureLifeBottomNavItem(
                  icon: AppIcons.shopping_cart, title: Strings.cart),
              PureLifeBottomNavItem(
                  icon: AppIcons.person, title: Strings.profile)
            ],
          ),
        ),
      );
    });
  }
}
