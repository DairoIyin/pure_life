import 'package:equatable/equatable.dart';

final class InitiatePaystackPaymentRequestDto extends Equatable {
  final num acquirerId;
  final num partnerId;
  final String reference;
  final num amount;
  final num currencyId;
  final List<SalesIds> salesOrderIds;

  InitiatePaystackPaymentRequestDto({
    required this.acquirerId,
    required this.partnerId,
    required this.reference,
    required this.amount,
    required this.currencyId,
    required this.salesOrderIds,
  });

  Map<String, dynamic> toJson() => {
        'acquirerId': acquirerId,
        'partnerId': partnerId,
        'reference': reference,
        'amount': amount,
        'currencyId': currencyId,
        'salesOrderIds': salesOrderIds.map((e) => e.toJson()).toList()
      };
  @override
  List<Object?> get props => [
        acquirerId,
        partnerId,
        amount,
        reference,
        amount,
        currencyId,
        salesOrderIds
      ];
}

final class SalesIds extends Equatable {
  final num id;
  final num salesId;

  SalesIds({
    required this.id,
    required this.salesId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'salesId': salesId,
      };

  @override
  List<Object?> get props => [id, salesId];
}


final class InitiatePaystackResponsePaymentDto extends Equatable{
    final num paymentTransactionId;
  InitiatePaystackResponsePaymentDto({required this.paymentTransactionId});

//the json['result'] for this result is a num
  factory InitiatePaystackResponsePaymentDto.fromJson(dynamic json) {
    return InitiatePaystackResponsePaymentDto(paymentTransactionId: json);
  }

   List<Object?> get props => [paymentTransactionId];
}