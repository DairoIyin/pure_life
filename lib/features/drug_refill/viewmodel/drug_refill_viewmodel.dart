import 'package:flutter/material.dart';
import 'package:pure_life/core/data/dto/product_response_dto.dart';
import 'package:pure_life/core/providers/product_provider.dart';
import 'package:pure_life/core/utils/disposable_change_notifier.dart';

import 'package:pure_life/features/home/domain/models/models.dart';

import 'package:pure_life/injection.dart';

class DrugRefillViewModel extends DisposableChangeNotifier {
  FocusNode searchFocusNode = FocusNode();
  List<Product> productsList = getIt.get<ProductProvider>().productList;

  TextEditingController searchController = TextEditingController();
  List<Product> displayDrugList = [];

  List<ProductItem> selectedDrugs = [];
  bool elementIsNotfound = false;
  void addToSelectedDrugs(ProductItem product) {
    selectedDrugs.add(product);

    notifyListeners();
  }

  void removeSelectedDrug(String title ) {
    selectedDrugs.removeWhere((element) => element.name==title);
    notifyListeners();
  }

  void searchList(String value) {
    displayDrugList = productsList
        .where((element) => element.title.toLowerCase().contains(value))
        .toList();

    if (displayDrugList.isEmpty) {
      elementIsNotfound = true;
    }

    if (value == '') {
      displayDrugList.clear();
    }
    notifyListeners();
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
    searchController.dispose();
    searchFocusNode.dispose();
  }
}
