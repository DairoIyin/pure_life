final baseUrl = 'https://api.purelifehealth.io';

class ApiEndpoints {
  //auth
  static final signUp = '$baseUrl/api/Contact/create';
  static final updateUser = '$baseUrl/api/Contact/update';
  static final changePassword = '$baseUrl/api/Contact/change-password';
  static final login = '$baseUrl/api/Contact/login';
  static final getPrescriptionById = '$baseUrl/api/prescription/getById';
  static final getAllPrescriptions = '$baseUrl/api/prescription/get-all';

  //product
  static final fetchProducts = '$baseUrl/api/Product/fetch-products';
  static final listProductCategories = '$baseUrl/api/Product/list-product-categories';
  static final getProducts = '$baseUrl/api/Product/get-products';
 static  final getDelivery = '$baseUrl/api/Product/get-delivery';



 //payment
  static final initializePayment = '$baseUrl/api/Payment/initialize-payment';
   static final verifyPayment = '$baseUrl/api/Payment/verify-payment';
}


