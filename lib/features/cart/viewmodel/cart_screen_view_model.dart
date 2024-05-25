import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:pure_life/core/data/data.dart';
import 'package:pure_life/core/data/dto/dto.dart';
import 'package:pure_life/core/data/mock_delivery_data.dart';
import 'package:pure_life/core/data/purelife_repository.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/link_launcher.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/auth/viewModels/login_screen_viewModel.dart';
import 'package:pure_life/features/auth/viewModels/signup_screen_view_model.dart';
import 'package:pure_life/features/cart/domain/models/cart_item.dart';
import 'package:pure_life/features/shop_and_order/viewmmodel/shop_and_order_viewmodel.dart';
import 'package:pure_life/injection.dart';
import 'package:uuid/uuid.dart';

class CartScreenViewModel extends DisposableChangeNotifier {
  final PureLifeRepository repo;
  final TokenRepository tokenRepository;
  CartScreenViewModel({required this.repo, required this.tokenRepository});
  num partnerId = -1;
  List<DeliveryItem> deliveryItems = [];
  List<ProductInfo> productsInfo = [];

  num deliveryPrice = 0;
  num saleOrderId = -1;
  num paymentTransactionId = -1;
  SaleInfo saleInfo = SaleInfo(id: -1, reference: '', amount_total: 0.0);
  String payStackLink = '';
  Map<num, CartItemModel> cartItems = {};
  DeliveryItem selectedDeliveryLocation = DeliveryItem.empty();
  String selectedDeliveryName = '';

  List<Location> countries = [];
  List<Location> states = [];
  List<Location> areas = [];

  String selectedCountry = '';
  String selectedState = '';
  String selectedArea = '';

  num countryId = -1;
  num stateId = -1;
  num cityId = -1;

  //Charge charge = Charge();
  num idFromLogin = getIt.get<LoginScreenViewModel>().partnerId;

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

  // Future<void> initializeOrder() async {
  //   print('initializing');
  //   createBulkSale().then((value) => readSale().then((value) {
  //         charge = Charge()
  //           ..amount = saleInfo.amount_total.toInt()
  //           ..reference = saleInfo.reference
  //           ..email = 'guestcheckoutuser@email.com';
  //       }));
  //   print('charge $charge');
  // }

  Future<void> placeOrder() async {
    getUserPartner().then(
      (value) => createBulkSale().then((value) {
        readSale().then((value) {
          createandInitiatePayment().then((value) => launchLink(payStackLink));
        });
      }),
    );
  }

  Future<void> getUserPartner() async {
    final response = await repo.getUserPartner(
        partnerId: tokenRepository.getToken().user?.partnerId);
    response.fold(
        (left) => showSnackBar(left.toString()),
        (right) =>
            partnerId = List.from(right.userPartners).first.partnerId.first);

    print('partnerId: $partnerId');
  }

  Future<void> createBulkSale() async {
    final dto = CreateBulkSaleRequestDto(
        partnerId: partnerId,
        products: cartItems.entries
            .map((e) => ProductInfo(
                productId: e.key, productQuantity: e.value.quantity))
            .toList());
    //add delivery item to  cart
    dto.products.add(ProductInfo(
        productId: selectedDeliveryLocation.id, productQuantity: 1));
    final response = await repo.createBulkSale(dto);
    response.fold((left) => showSnackBar(left.toString()),
        (right) => saleOrderId = response.right);
    print('saleOrderId: $saleOrderId');
  }

//confirm if this can containe many sales
  Future<void> readSale() async {
    final response = await repo.readSale(saleOrderId);
    response.fold((left) => showSnackBar(left.toString()),
        (right) => saleInfo = response.right.saleOrderId.first);
    print('saleInfo : ${saleInfo.toString()}');
  }

  //getDeliveryItems TODO Chnange this to repo.getDelivery and
  Future<void> getDeliveryLocations({
    bool? isPublished = false,
    num? minPrice = 0,
    num? maxPrice = 100000,
    num? limit = 100,
    num? offset = 0,
  }) async {
    final response = await repo.getDelivery(
        isPublished: isPublished,
        categoryId: 16,
        minPrice: minPrice,
        maxPrice: maxPrice,
        limit: limit,
        offset: offset);

    response.fold((left) => showSnackBar(left.toString()),
        (right) => deliveryItems = List.from(right.deliveryItems));
    selectedDeliveryLocation = deliveryItems[0];
    selectedDeliveryName = selectedDeliveryLocation.name;
    notifyListeners();
  }

  num getPriceByName(List deliveryItems, String name) {
    final location =
        deliveryItems.firstWhere((element) => element.name == name);
    return location.price;
  }

  // Future<void> initiatePaystackPayment() async {
  //   final dto = InitiatePaystackPaymentRequestDto(
  //       acquirerId: 16,
  //       partnerId: 10402,
  //       reference: saleInfo.reference,
  //       amount: saleInfo.amount_total,
  //       currencyId: 120,
  //       salesOrderIds: [SalesIds(id: 4, salesId: saleInfo.id)]);
  //   final response = await _repo.initiatePaystackPayment(dto);
  //   response.fold((left) => showSnackBar(left.toString()),
  //       (right) => paymentTransactionId = response.right);
  // }

  Future<void> createandInitiatePayment() async {
    final dto = CreateandInitiateRequestDto(
        journalId: 17,
        partnerId: partnerId,
        reference: saleInfo.reference,
        amount: saleInfo.amount_total,
        currencyId: 120,
        paymentMethodLineId: 22,
        email: tokenRepository.getToken().user?.email ?? '',
        acquirerId: 16,
        salesOrderIds: [SalesIds(id: 4, salesId: saleInfo.id)],
        paymentType: "inbound");
    final response = await repo.createandInitiatePayment(dto);
    response.fold((left) => showSnackBar(left.toString()), (right) {
      final res = CreateandInitiateResponseDto.fromJson(
          response.right?.data as Map<String, dynamic>);
      payStackLink = res.paystackChechoutLink;
    });
    print('paystackLink $payStackLink');
  }

  // Future<void> validatePayment() async {
  //   final dto = ValidatePaymentRequestDto(paymentId: paymentId);
  //   final response = await _repo.validatePayment(dto);
  //   response.fold((left) => showSnackBar(left.toString()), (right) {
  //     print(response.right);
  //   });
  // }

  Future<void> getCountries() async {
    final response = await repo.listCountries();
    response.fold((left) => showSnackBar(left.toString()),
        (right) => countries = List.from(right.locationList));
    selectedCountry = countries[0].name;
    notifyListeners();
  }

  Future<void> getStates() async {
    final response = await repo.listStateInCountry(countryId: countryId);
    response.fold((left) => showSnackBar(left.toString()),
        (right) => states = List.from(right.locationList));
    selectedState = states[0].name;
    notifyListeners();
  }

  Future<void> getCities() async {
    final response = await repo.listAreasInState(stateId: stateId);
    response.fold((left) => showSnackBar(left.toString()),
        (right) => areas = List.from(right.locationList));
    selectedArea = areas[0].name;
    notifyListeners();
  }

  num getLocationIdByName(List<Location> locationList, String name) {
    final location = locationList.firstWhere((element) => element.name == name);
    return location.id;
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
    return total + deliveryPrice;
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
