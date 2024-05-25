import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
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
  Future<EitherExceptionOr<Response<dynamic>?>> login(
      LoginRequestDto dto) async {
    final response = await client.call(
        path: ApiEndpoints.login,
        method: RequestMethod.post,
        body: dto.toJson());

    return response;
  }

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
  Future<EitherExceptionOr<LocationResponseDto>> listCountries(
      {num? limit, num? offset}) async {
    final response = await client.call(
        path: ApiEndpoints.listCountries,
        method: RequestMethod.get,
        queryParams: {
          'Fields': ['name'],
          // 'Limit': limit,
          // 'Offset': offset
        });
    return await processData(LocationResponseDto.fromJson, response);
  }

  @override
  Future<EitherExceptionOr<LocationResponseDto>> listStateInCountry(
      {required num countryId, num? limit, num? offset}) async {
    final response = await client.call(
        path: ApiEndpoints.listStateInCountry,
        method: RequestMethod.get,
        queryParams: {
          'CountryId': countryId,
          'Fields': ['name'],
          // 'Limit': limit,
          // 'Offset': offset
        });
    return await processData(LocationResponseDto.fromJson, response);
  }

  @override
  Future<EitherExceptionOr<LocationResponseDto>> listAreasInState(
      {required num stateId, num? limit, num? offset}) async {
    final response = await client.call(
        path: ApiEndpoints.listAreasInState,
        method: RequestMethod.get,
        queryParams: {
          'StateId': stateId,
          'Fields': ['name'],
          // 'Limit': limit,
          // 'Offset': offset
        });
    return await processData(LocationResponseDto.fromJson, response);
  }

  @override
  Future<EitherExceptionOr<ProductResponseDto>> fetchProducts(
      {bool? isPublished,
      num? categoryId,
      num? minPrice,
      num? maxPrice,
      num? limit,
      num? offset}) async {
    final response = await client.call(
      path: ApiEndpoints.fetchProducts,
      method: RequestMethod.get,
      queryParams: {
        'IsPublished': isPublished,
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
  Future<EitherExceptionOr<UserPartnerResponseDto>> getUserPartner({
    num? partnerId,
  }) async {
    final response = await client.call(
        path: ApiEndpoints.getUserPartner,
        method: RequestMethod.get,
        queryParams: {'PartnerIds': partnerId, 'Fields': 'partner_id'});

    return await processData(UserPartnerResponseDto.fromJson, response);
  }



  @override
  Future<EitherExceptionOr<num>> createBulkSale(
      CreateBulkSaleRequestDto dto) async {
    final response = await client.call(
        path: ApiEndpoints.createBulkSale,
        method: RequestMethod.post,
        body: dto.toJson());

    return await processData((data) => data, response);
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

  // @override
  // Future<EitherExceptionOr<num>> initiatePaystackPayment(
  //     InitiatePaystackPaymentRequestDto dto) async {
  //   final response = await client.call(
  //       path: ApiEndpoints.initiatePaystackPayment,
  //       method: RequestMethod.post,
  //       body: dto.toJson());

  //   return await processData((data) => data, response);
  // }

  @override
  Future<EitherExceptionOr<Response<dynamic>?>> createandInitiatePayment(
      CreateandInitiateRequestDto dto) async {
    final response = await client.call(
        path: ApiEndpoints.createandInitiatePayment,
        method: RequestMethod.post,
        body: dto.toJson());

    return response;
  }

  @override
  Future<EitherExceptionOr<num>> validatePayment(
      ValidatePaymentRequestDto dto) async {
    final response = await client.call(
        path: ApiEndpoints.validatePayment,
        method: RequestMethod.post,
        body: dto.toJson());

    return await processData((data) => data, response);
  }

  @override
  Future<EitherExceptionOr<DeliveryResponseDto>> getDelivery({bool? isPublished,
      num? categoryId,
      num? minPrice,
      num? maxPrice,
      num? limit,
      num? offset}) async {
    final response = await client.call(
        path: ApiEndpoints.fetchProducts, method: RequestMethod.get, queryParams: {
        'IsPublished': isPublished,
        'CategoryId': categoryId,
        'MinListPrice': minPrice,
        'MaxListPrice': maxPrice,
        'Fields': ['name', 'lst_price'],
        'Limit': limit,
        'Offset': offset
      },);

    return await processData(DeliveryResponseDto.fromJson, response);
  }
}
