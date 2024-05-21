import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/data/dto/dto.dart';
import 'package:pure_life/core/data/dto/product_response_dto.dart';
import 'package:pure_life/core/data/purelife_repository.dart';
import 'package:pure_life/core/utils/disposable_change_notifier.dart';
import 'package:pure_life/core/utils/enums/category_enum.dart';
import 'package:pure_life/core/utils/enums/price_range.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/home/domain/models/models.dart';

class ShopScreenViewModel extends DisposableChangeNotifier {
  final PureLifeRepository _repo;

  ShopScreenViewModel(this._repo);
  List<ProductItem> productsList = [];
  List<CategoryItem> categories = [];
  num categoryId = -1;
  int noOfPages = 5;
  int currentPage = 0;
  final pageController = PageController(viewportFraction: 1);
  bool promoIsDisplayed = true;
  void onPageChanged(BuildContext context, int index, CategoryEnum category) {
    currentPage = index;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ShopScreenViewModel>(context, listen: false)
          .fetchProducts(category: category, offset: 10 * index);
    });
    notifyListeners();
  }

  PriceRange? priceRange = PriceRange.below1;
  void onRadioChanged(PriceRange? value) {
    priceRange = value;
    notifyListeners();
  }

  void incrementProductItem({required num productId, required num quantity}) {
    quantity++;
    getProductById(productId)?.quantity = quantity;
    notifyListeners();
  }

  void decrementProductItem({required num productId, required num quantity}) {
    if (quantity > 1) {
      quantity--;
    }
    getProductById(productId)?.quantity = quantity;
    notifyListeners();
  }

  void updateProductQuantity(num id, num quantity) {
    ProductItem prod = productsList.firstWhere((element) => element.id == id);
    prod.quantity = quantity;
  }

  double getTotal(ProductItem productItem) {
    double total = 0.0;
    if (productItem == null) {
      total += 0;
    } else {
      total += productItem.price * productItem.quantity;
    }
    return total;
  }

  Future<void> getCategories() async {
    final response = await _repo.listProductCategories();
    response.fold(
        (left) => null, (right) => categories = List.from(right.categories));
    notifyListeners();
  }

  void getCategoryId(CategoryEnum category) {
    if (categories.isNotEmpty) {
      final selectedCategory = categories
          .firstWhere((element) => element.name.toLowerCase() == category.name);
      categoryId = selectedCategory.id;
    }
  }

  Future<void> fetchProducts(
      {num? minPrice = 0,
      num? maxPrice = 100000,
      num? limit = 10,
      num? offset = 0,
      required CategoryEnum category}) async {
    //get the id of the category and pass as query param to fetchProducts
    getCategoryId(category);

    final response = await _repo.fetchProducts(
        categoryId: categoryId,
        minPrice: minPrice,
        maxPrice: maxPrice,
        limit: limit,
        offset: offset);

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
