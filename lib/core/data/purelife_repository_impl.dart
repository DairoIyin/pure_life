import 'package:pure_life/core/data/dto/dto.dart';
import 'package:pure_life/core/data/dto/product_response_dto.dart';
import 'package:pure_life/core/data/purelife_repository.dart';
import 'package:pure_life/core/network/api_client.dart';
import 'package:pure_life/core/network/network.dart';

import 'dto/delivery_response_dto.dart';

class PureLifeRepositoryImpl extends PureLifeRepository {
  PureLifeRepositoryImpl({required this.client});
  final ApiClient client;

  @override
  Future<EitherExceptionOr<CategoriesResponseDto>>
      listProductCategories() async {
    final response = await client.call(
        path: ApiEndpoints.listProductCategories,
        method: RequestMethod.get,
        queryParams: {
          'Fields': ['name'],
        });
    return await processData(CategoriesResponseDto.fromJson, response);
  }

  @override
  Future<EitherExceptionOr<ProductResponseDto>> fetchProducts(
      {num? categoryId,
      num? minPrice,
      num? maxPrice,
      num? limit,
      num? offset}) async {
    final response = await client.call(
      path: ApiEndpoints.fetchProducts,
      method: RequestMethod.get,
      queryParams: {
        'IsPublished': true,
        'CategoryId': categoryId,
        'MinListPrice': minPrice,
        'MaxListPrice': maxPrice,
        'Fields': ['name', 'lst_price', 'image_1024'],
        'Limit': limit,
        'Offset': offset
      },
    );
    return await processData(ProductResponseDto.fromJson, response);
  }

  @override
  Future<EitherExceptionOr<ProductResponseDto>> getProducts() async {
    final response = await client.call(
        path: ApiEndpoints.getProducts, method: RequestMethod.get);

    return await processData(ProductResponseDto.fromJson, response);
  }

  @override
  Future<EitherExceptionOr<num>> createBulkSale(
      CreateBulkSaleRequestDto dto) async {
    final response = await client.call(
        path: ApiEndpoints.createBulkSale,
        method: RequestMethod.post,
        body: dto.toJson());

    return await processData((data)=>data, response);
  }

  @override
  Future<EitherExceptionOr<ReadSaleResponseDto>> readSale(
      num saleOrderId) async {
    final response = await client.call(
        path: ApiEndpoints.readSale,
        method: RequestMethod.get,
        queryParams: {'SaleOrderId': saleOrderId});

    return await processData(ReadSaleResponseDto.fromJson, response);
  }

  @override
  Future<EitherExceptionOr<num>>
      initiatePaystackPayment(InitiatePaystackPaymentRequestDto dto) async {
    final response = await client.call(
        path: ApiEndpoints.initiatePaystackPayment,
        method: RequestMethod.post,
        body: dto.toJson());

    return await processData(
        (data)=>data, response);
  }

  @override
  Future<EitherExceptionOr<num>> createPayment(
      CreatePaymentRequestDto dto) async {
    final response = await client.call(
        path: ApiEndpoints.createPayment,
        method: RequestMethod.post,
        body: dto.toJson());

    return await processData((data)=>data, response);
  }
  
 @override
  Future<EitherExceptionOr<num>> validatePayment(ValidatePaymentRequestDto dto) async {
     final response = await client.call(
        path: ApiEndpoints.validatePayment,
        method: RequestMethod.post,
        body: dto.toJson());

    return await processData(
        (data)=>data, response);
  }

  @override
  Future<EitherExceptionOr<DeliveryResponseDto>> getDelivery() async {
    final response = await client.call(
        path: ApiEndpoints.getDelivery, method: RequestMethod.get);

    return await processData(DeliveryResponseDto.fromJson, response);
  }
}
