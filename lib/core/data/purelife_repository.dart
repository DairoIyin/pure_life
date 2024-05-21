import 'package:pure_life/core/data/dto/dto.dart';
import 'package:pure_life/core/network/data_transformer.dart';

abstract class PureLifeRepository {
  const PureLifeRepository();

  Future<EitherExceptionOr<ProductResponseDto>> fetchProducts(
      {num? categoryId,
      num? minPrice,
      num? maxPrice,
      num? limit,
      num? offset});
  Future<EitherExceptionOr<CategoriesResponseDto>> listProductCategories();
  // returns num result
  Future<EitherExceptionOr<num>> createBulkSale(
      CreateBulkSaleRequestDto dto);
  Future<EitherExceptionOr<ReadSaleResponseDto>> readSale(num saleOrderId);
  //todo: ask about this o
 
  Future<EitherExceptionOr<DeliveryResponseDto>> getDelivery();
  Future<EitherExceptionOr<num>>
      initiatePaystackPayment(InitiatePaystackPaymentRequestDto dto);
  Future<EitherExceptionOr<num>> createPayment(
      CreatePaymentRequestDto dto);
        Future<EitherExceptionOr> validatePayment(
      ValidatePaymentRequestDto dto);
}
