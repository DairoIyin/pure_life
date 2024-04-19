import 'package:flutter/material.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/domain/models/models.dart';

class HomeScreenViewModel extends DisposableChangeNotifier {
  final pageController = PageController(viewportFraction: 1);
  bool promoIsDisplayed = true;
  List<PromoInfo> promos = [
    PromoInfo(
        image: AppImages.promo_img1,
        title: 'Get 50% Off \nCouples Lab Test',
        action: Strings.bookTest),
    PromoInfo(
        image: AppImages.promo_img1,
        title: 'Get 50% Off \nCouples Lab Test',
        action: Strings.bookTest),
    PromoInfo(
        image: AppImages.promo_img1,
        title: 'Get 50% Off \nCouples Lab Test',
        action: Strings.bookTest),
  ];

  List<ShopItem> shopItems = [
    ShopItem(
        id: 1,
        amount: '2,550.00',
        image: AppImages.drug1,
        title: 'Amino Pep 200ml'),
    ShopItem(
        id: 1,
        amount: '2,550.00',
        image: AppImages.drug2,
        title: 'Amino Pep 200ml'),
    ShopItem(
        id: 1,
        amount: '2,550.00',
        image: AppImages.drug1,
        title: 'Amino Pep 200ml'),
    ShopItem(
        id: 1,
        amount: '2,550.00',
        image: AppImages.drug2,
        title: 'Amino Pep 200ml')
  ];
  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
