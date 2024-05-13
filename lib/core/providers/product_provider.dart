import 'package:flutter/material.dart';
import 'package:pure_life/core/common_models/product.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:uuid/uuid.dart';

class ProductProvider extends ChangeNotifier {
 

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

  List<Product> supermarketList = [
    Product(
      id: '1',
      price: 700,
      image: AppImages.shop1,
      title: 'Active',
    ),
    Product(
      id: '2',
      price: 2500,
      image: AppImages.shop2,
      title: 'Big Mac 2',
    ),
    Product(
      id: '3',
      price: 700,
      image: AppImages.shop3,
      title: 'Vigor',
    ),
    Product(
      id: '4',
      price: 1500,
      image: AppImages.drug2,
      title: 'Nestle',
    ),
  ];

  List<Product> skincareList = [
    Product(
      id: '1',
      price: 700,
      image: AppImages.skincare1,
      title: 'Liz Earle',
    ),
    Product(
      id: '2',
      price: 2500,
      image: AppImages.skincare2,
      title: 'Cerave',
    ),
    Product(
      id: '3',
      price: 700,
      image: AppImages.skincare1,
      title: 'Liz Earle',
    ),
    Product(
      id: '4',
      price: 1500,
      image: AppImages.skincare2,
      title: 'Cerave',
    ),
  ];
}
