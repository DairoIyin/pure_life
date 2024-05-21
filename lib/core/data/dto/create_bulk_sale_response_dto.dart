import 'package:equatable/equatable.dart';

class CreateBulkSaleResponseDto extends Equatable {
  final num saleOrderId;
  CreateBulkSaleResponseDto({required this.saleOrderId});

//the json['result'] for this result is a num
  factory CreateBulkSaleResponseDto.fromJson(dynamic json) {
    return CreateBulkSaleResponseDto(saleOrderId: json);
  }

   List<Object?> get props => [saleOrderId];
}
