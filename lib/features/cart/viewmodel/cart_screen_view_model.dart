import 'package:flutter/material.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/domain/models/cart_item.dart';

class CartScreenViewModel extends DisposableChangeNotifier {
 final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
 

String? fNameErrorText = '';
  String? lNameErrorText = '';
  
  List<CartItem> cartItems = [
    CartItem(
        amount: '89,250.00',
        description: 'Drug description',
        quantity: 1,
        title: 'Chlamydia IgM Ab',
        weight: '250mg'),
    CartItem(
        amount: '89,250.00',
        description: 'Drug description',
        quantity: 1,
        title: 'Lokmal Qs-Tab',
        weight: '250mg'),
    CartItem(
        amount: '89,250.00',
        description: 'Drug description',
        quantity: 1,
        title: 'Amino Pep',
        weight: '250mg'),
  ];

  void incrementQuantity(int value) {
    value++;
    notifyListeners();
  }

  void decrementQuantity(int value) {
     value++;
     notifyListeners();
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
