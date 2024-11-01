import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pure_life/core/data/dto/product_response_dto.dart';
import 'package:pure_life/core/data/purelife_repository.dart';
import 'package:pure_life/core/utils/disposable_change_notifier.dart';
import 'package:pure_life/core/utils/enums/price_range.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/domain/models/models.dart';

class ShopScreenViewModel extends DisposableChangeNotifier {
  final PureLifeRepository _repo;

  ShopScreenViewModel(this._repo);
  List<ProductItem> productsList = [];
  int noOfPages = 4;
  int currentPage = 0;
  final pageController = PageController(viewportFraction: 1);
  bool promoIsDisplayed = true;
  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  PriceRange? priceRange = PriceRange.below1;
  void onRadioChanged(PriceRange? value) {
    priceRange = value;
    notifyListeners();
  }

  Future<void> getProducts() async {
    final response = await _repo.getProducts();

    response.fold(
        (left) => null, (right) => productsList = List.from(right.products));
    notifyListeners();
  }

  ProductItem? getProductById(num id) {
    if (productsList.where((element) => element.id == id).isEmpty) {
      return null;
    }
    return productsList.firstWhere((element) => element.id == id);
  }

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
  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
