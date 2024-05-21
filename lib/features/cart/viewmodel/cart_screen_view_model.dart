import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
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
  List<ProductInfo> productsInfo = [];
  num saleOrderId = -1;
  num paymentTransactionId = -1;
  SaleInfo saleInfo = SaleInfo(id: -1, reference: '', amount_total: 0.0);
  num paymentId = -1;
  Map<num, CartItemModel> cartItems = {};
  String selectedDeliveryLocation = '';
  String selectedState = '';
  Charge charge = Charge();
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
  String errorText = '';

  Future<void> getDeliveryLocations() async {
    final response = await _repo.getDelivery();

    response.fold((left) => null,
        (right) => deliveryItems = List.from(right.deliveryLocations));
    notifyListeners();
  }

  Future<void> initializeOrder() async {
    print('initializing');
    createBulkSale().then((value) => readSale().then((value) {
          charge = Charge()
            ..amount = saleInfo.amount_total.toInt()
            ..reference = saleInfo.reference
            ..email = 'guestcheckoutuser@email.com';
        }));
    print('charge $charge');
  }

  Future<void> placeOrder() async {
    createBulkSale().then((value) {
      readSale().then((value) {
        initiatePaystackPayment().then((value) {
          createPayment().then((value) => validatePayment());
        });
      });
    });
  }

  Future<void> createBulkSale() async {
    final dto = CreateBulkSaleRequestDto(
        partnerId: 10402,
        products: cartItems.entries
            .map((e) => ProductInfo(
                productId: e.key, productQuantity: e.value.quantity))
            .toList());
    final response = await _repo.createBulkSale(dto);
    response.fold((left) => null, (right) => saleOrderId = response.right);
  }

//confirm if this can containe many sales
  Future<void> readSale() async {
    final response = await _repo.readSale(saleOrderId);
    response.fold(
        (left) => null, (right) => saleInfo = response.right.saleOrderId.first);
  }

  Future<void> initiatePaystackPayment() async {
    final dto = InitiatePaystackPaymentRequestDto(
        acquirerId: 16,
        partnerId: 10402,
        reference: saleInfo.reference,
        amount: saleInfo.amount_total,
        currencyId: 120,
        salesOrderIds: [SalesIds(id: 4, salesId: saleInfo.id)]);
    final response = await _repo.initiatePaystackPayment(dto);
    response.fold(
        (left) => null, (right) => paymentTransactionId = response.right);
  }

  Future<void> createPayment() async {
    final dto = CreatePaymentRequestDto(
        journalId: 17,
        partnerId: 10402,
        reference: saleInfo.reference,
        amount: saleInfo.amount_total,
        currencyId: 120,
        paymentMethodLineId: 22,
        paymentTransactionId: paymentTransactionId,
        paymentType: "inbound");
    final response = await _repo.createPayment(dto);
    response.fold((left) => null, (right) => paymentId = response.right);
  }

  Future<void> validatePayment() async {
    final dto = ValidatePaymentRequestDto(paymentId: paymentId);
    final response = await _repo.validatePayment(dto);
    response.fold((left) => null, (right) {
      print(response.right);
    });
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

  void removeFromCart({required num productId}) {
    cartItems.removeWhere((key, value) => key == productId);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
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
    //update the products quantity after it has been updated in the cart
    //not allowing UI update todo: figure out another way.
    // getIt.get<ShopScreenViewModel>().updateProductQuantity(productId, quantity);
    notifyListeners();
  }

  void decrementCartItem({required num productId, required num quantity}) {
    if (quantity > 1) {
      quantity--;
    }

    cartItems.update(
        productId,
        (cartItem) => CartItemModel(
            productId: productId, cartId: cartItem.cartId, quantity: quantity));
    //update the products quantity after it has been updated in the cart
    //getIt.get<ShopScreenViewModel>().updateProductQuantity(productId, quantity);
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
