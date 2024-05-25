import 'package:dio/dio.dart';
import 'package:pure_life/core/data/dto/dto.dart';
import 'package:pure_life/core/network/data_transformer.dart';

abstract class PureLifeRepository {
  const PureLifeRepository();
  Future<EitherExceptionOr<Response<dynamic>?>> login(LoginRequestDto dto);
  Future<EitherExceptionOr<LocationResponseDto>> listCountries(
      {num? limit, num? offset});
  Future<EitherExceptionOr<LocationResponseDto>> listStateInCountry(
      {required num countryId, num? limit, num? offset});
  Future<EitherExceptionOr<LocationResponseDto>> listAreasInState(
      {required num stateId, num? limit, num? offset});
  Future<EitherExceptionOr<ProductResponseDto>> fetchProducts(
      {bool? isPublished,
      num? categoryId,
      num? minPrice,
      num? maxPrice,
      num? limit,
      num? offset});
  Future<EitherExceptionOr<UserPartnerResponseDto>> getUserPartner({
    num? partnerId,
  });
  Future<EitherExceptionOr<CategoriesResponseDto>> listProductCategories();
  // returns num result
  Future<EitherExceptionOr<num>> createBulkSale(CreateBulkSaleRequestDto dto);
  Future<EitherExceptionOr<ReadSaleResponseDto>> readSale(num saleOrderId);
  //todo: ask about this o

  Future<EitherExceptionOr<DeliveryResponseDto>> getDelivery(
      {bool? isPublished,
      num? categoryId,
      num? minPrice,
      num? maxPrice,
      num? limit,
      num? offset});
  // Future<EitherExceptionOr<num>> initiatePaystackPayment(
  //     InitiatePaystackPaymentRequestDto dto);
  Future<EitherExceptionOr<Response<dynamic>?>> createandInitiatePayment(
      CreateandInitiateRequestDto dto);
  Future<EitherExceptionOr> validatePayment(ValidatePaymentRequestDto dto);
}
