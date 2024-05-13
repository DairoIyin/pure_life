import 'package:pure_life/core/data/dto/product_response_dto.dart';
import 'package:pure_life/core/data/purelife_repository.dart';
import 'package:pure_life/core/network/api_client.dart';
import 'package:pure_life/core/network/network.dart';

import 'dto/delivery_response_dto.dart';

class PureLifeRepositoryImpl extends PureLifeRepository {
  PureLifeRepositoryImpl({required this.client});
  final ApiClient client;

  @override
  Future<EitherExceptionOr<ProductResponseDto>> fetchProducts() async {
    final response = await client.call(
        path: ApiEndpoints.fetchProducts, method: RequestMethod.get);
    return await processData(ProductResponseDto.fromJson, response);
  }

  @override
  Future<EitherExceptionOr<ProductResponseDto>> getProducts() async {
  
    final response = await client.call(
        path: ApiEndpoints.getProducts, method: RequestMethod.get);
  
    return await processData(ProductResponseDto.fromJson, response);
  }
 
  @override
  Future<EitherExceptionOr<DeliveryResponseDto>> getDelivery() async {
  
    final response = await client.call(
        path: ApiEndpoints.getDelivery, method: RequestMethod.get);
  
    return await processData(DeliveryResponseDto.fromJson, response);
  }

   @override
  Future<EitherExceptionOr> initializePayment() async {
  
    final response = await client.call(
        path: ApiEndpoints.initializePayment, method: RequestMethod.post);
  
    return await processData((data)=>null, response);
  }

   @override
  Future<EitherExceptionOr> verifyPayment() async {
  
    final response = await client.call(
        path: ApiEndpoints.verifyPayment, method: RequestMethod.post);
  
    return await processData((data)=>null, response);
  }
}
