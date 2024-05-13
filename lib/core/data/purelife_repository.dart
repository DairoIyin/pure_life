import 'package:pure_life/core/data/dto/product_response_dto.dart';
import 'package:pure_life/core/network/data_transformer.dart';

import 'dto/delivery_response_dto.dart';

abstract class PureLifeRepository {
  const PureLifeRepository();

  Future<EitherExceptionOr<ProductResponseDto>> fetchProducts();
  //todo: ask about this o
  //Future<EitherExceptionOr<>> listProductCategories();
  Future<EitherExceptionOr<ProductResponseDto>> getProducts();
  Future<EitherExceptionOr<DeliveryResponseDto>> getDelivery();
  Future<EitherExceptionOr> initializePayment();
  Future<EitherExceptionOr> verifyPayment();



}
