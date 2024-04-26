import 'package:flutter/material.dart';
import 'package:pure_life/core/common_models/product.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:uuid/uuid.dart';

class ProductProvider extends ChangeNotifier {
  Product? getProductById(String id) {
    if (productList.where((element) => element.id == id).isEmpty) {
      return null;
    }
    return productList.firstWhere((element) => element.id == id);
  }

  List<Product> productList = [
    Product(
        id: '1',
        price: 700,
        image: AppImages.drug1,
        title: 'Chlamydia IgM Ab',
        quantityInDrug: '32 tablets',
        weight: '500mg'),
    Product(
        id: '2',
        price: 2500,
        image: AppImages.drug2,
        title: 'Lokmal Qs-Tab',
        quantityInDrug: '32 tablets',
        weight: '500mg'),
    Product(
        id: '3',
        price: 700,
        image: AppImages.drug1,
        title: 'Amino Pep',
        quantityInDrug: '32 tablets',
        weight: '500mg'),
    Product(
        id: '4',
        price: 1500,
        image: AppImages.drug2,
        title: 'Aspar Paracetamol',
        quantityInDrug: '32 tablets',
        weight: '500mg'),
  ];
}
