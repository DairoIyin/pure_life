import 'package:equatable/equatable.dart';

final class CreateBulkSaleRequestDto extends Equatable {
  final num partnerId;
  final List<ProductInfo> products;

  const CreateBulkSaleRequestDto(
      {required this.partnerId, required this.products});

  Map<String, dynamic> toJson() {
    return {
      'partnerId': partnerId,
      'products': products.map((e) => e.toJson()).toList()
    };
  }

  @override
  List<Object?> get props => [partnerId, products];
}

final class ProductInfo extends Equatable {
  final num productId;
  final num productQuantity;

  ProductInfo({required this.productId, required this.productQuantity});

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'productQuantity': productQuantity};
  }

  @override
  List<Object?> get props => [productId, productQuantity];
}
