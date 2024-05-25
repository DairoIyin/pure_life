//final baseUrl = 'https://api.purelifehealth.io';
import 'package:pure_life/core/utils/config.dart';

final baseUrl = AppConfig.baseUrl;

class ApiEndpoints {
  //auth
  static final signUp = '$baseUrl/api/Contact/create';
  static final updateUser = '$baseUrl/api/Contact/update';
  static final changePassword = '$baseUrl/api/Contact/change-password';
  static final login = '$baseUrl/api/Auth/login';
  static final getPrescriptionById = '$baseUrl/api/prescription/getById';
  static final getAllPrescriptions = '$baseUrl/api/prescription/get-all';

  //Users
  static final getUserPartner = '$baseUrl/api/Users/get-user-partner';

//countries
  static final listCountries = '$baseUrl/api/Countries/list-countries';
  static final listStateInCountry =
      '$baseUrl/api/Countries/list-state-in-country';
  static final listAreasInState = '$baseUrl/api/Countries/list-areas-in-state';
  //product
  static final fetchProducts = '$baseUrl/api/Product/fetch-products';
  static final listProductCategories =
      '$baseUrl/api/Product/list-product-categories';
  static final getProducts = '$baseUrl/api/Product/get-products';
  static final getDelivery = '$baseUrl/api/Product/get-delivery';

//sales
  static final createBulkSale = '$baseUrl/api/Sales/create-bulk-sale';
  static final readSale = '$baseUrl/api/Sales/read-sale';

  //transactions
  static final initiatePaystackPayment =
      '$baseUrl/api/Transactions/initiate-paystack-payment';
  static final createandInitiatePayment =
      '$baseUrl/api/Transactions/create-and-initiate';
  static final validatePayment = '$baseUrl/api/Transactions/validate-payment';
}
