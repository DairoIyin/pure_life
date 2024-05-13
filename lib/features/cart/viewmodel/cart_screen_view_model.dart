import 'package:flutter/material.dart';
import 'package:pure_life/core/data/dto/dto.dart';
import 'package:pure_life/core/data/purelife_repository.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/domain/models/cart_item.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/injection.dart';
import 'package:uuid/uuid.dart';

class CartScreenViewModel extends DisposableChangeNotifier {
  final PureLifeRepository _repo;
  CartScreenViewModel(this._repo);
  List<DeliveryItem> deliveryItems = [];

  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController streetAddress = TextEditingController();
  final TextEditingController deliveryAddress = TextEditingController();
  final TextEditingController apartment = TextEditingController();
  final TextEditingController town = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final fbKey = GlobalKey<FormState>();
  String? errorText = '';
  Map<num, CartItemModel> cartItems = {};
  DeliveryItem selectedDeliveryLocation=DeliveryItem(id: 0, name: '', price: 0, canBePurchased: true, quantity: 1, canBeSold: true, description: '', imageInBinary: '', createdDate: '');
  Future<void> getDeliveryLocations() async {
    final response = await _repo.getDelivery();

    response.fold((left) => null,
        (right) => deliveryItems = List.from(right.deliveryLocations));
    notifyListeners();
  }

  CartItemModel? getCartItemById(String cartId) {
    if (cartItems.values
        .toList()
        .where((element) => element.cartId == cartId)
        .isEmpty) {
      return null;
    }
    return cartItems.values
        .toList()
        .firstWhere((element) => element.cartId == cartId);
  }

  void addToCart({required num productId}) {
    cartItems.putIfAbsent(
        productId,
        () => CartItemModel(
            productId: productId, cartId: const Uuid().v4(), quantity: 1));
    notifyListeners();
  }

  bool productIsInCart({required num productId}) {
    return cartItems.containsKey(productId);
  }

  void incrementCartItem({required num productId, required num quantity}) {
    quantity++;
    cartItems.update(
        productId,
        (cartItem) => CartItemModel(
            productId: productId, cartId: cartItem.cartId, quantity: quantity));
    notifyListeners();
  }

  void decrementCartItem({required num productId, required num quantity}) {
    quantity--;
    cartItems.update(
        productId,
        (cartItem) => CartItemModel(
            productId: productId, cartId: cartItem.cartId, quantity: quantity));
    notifyListeners();
  }

  double getTotal(ShopScreenViewModel shopScreenModel) {
    double total = 0.0;
    cartItems.forEach((key, value) {
      final currentProduct = shopScreenModel.getProductById(value.productId);
      if (currentProduct == null) {
        total += 0;
      } else {
        total += currentProduct.price * value.quantity;
      }
    });
    return total;
  }
  // List<CartItem> cartItems = [
  //   CartItem(
  //       amount: 89250.00,
  //       description: 'Drug description',
  //       quantity: 1,
  //       title: 'Chlamydia IgM Ab',
  //       weight: '250mg'),
  //   CartItem(
  //       amount: 89250.00,
  //       description: 'Drug description',
  //       quantity: 1,
  //       title: 'Lokmal Qs-Tab',
  //       weight: '250mg'),
  //   CartItem(
  //       amount: 89250.00,
  //       description: 'Drug description',
  //       quantity: 1,
  //       title: 'Amino Pep',
  //       weight: '250mg'),
  // ];

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
