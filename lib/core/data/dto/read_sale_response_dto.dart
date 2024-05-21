import 'package:equatable/equatable.dart';

class ReadSaleResponseDto extends Equatable {
  final List<SaleInfo> saleOrderId;
  const ReadSaleResponseDto({required this.saleOrderId});

  factory ReadSaleResponseDto.fromJson(dynamic json) {
    return switch (json) {
      final List list? => ReadSaleResponseDto(
          saleOrderId: list
              .map((e) => SaleInfo.fromJson(e as Map<String, dynamic>))
              .toList()),
      _ => const ReadSaleResponseDto(saleOrderId: [])
    };
  }
  List<Object?> get props => [saleOrderId];
}

class SaleInfo extends Equatable {
  final num id;
  final String reference;
  final num amount_total;

  SaleInfo({required this.id, required this.reference, required this.amount_total});

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
        id: json['id'] ?? 0.0,
        reference: json['name'] ?? '',
        amount_total: json['amount_total']);
  }

  List<Object?> get props => [id, reference, amount_total];
}
