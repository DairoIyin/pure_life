import 'package:equatable/equatable.dart';

final class CreatePaymentRequestDto extends Equatable {
  
  final num partnerId;
  final num amount;
  final num currencyId;
  final String paymentType;
  final num journalId;
  final num paymentMethodLineId;
  final String reference;
  final num paymentTransactionId;
  

  CreatePaymentRequestDto({
    required this.journalId,
    required this.partnerId,
    required this.reference,
    required this.amount,
    required this.currencyId,
    required this.paymentMethodLineId,
    required this.paymentTransactionId,
    required this.paymentType
    ,
  });

  Map<String, dynamic> toJson() => {
        'partnerId': partnerId,
        'amount': amount,
        'currencyId': currencyId,
        'paymentType': paymentType,
        'journalId': journalId,
        'paymentMethodLineId': paymentMethodLineId,
        'reference': reference,
        'paymentTransactionId': paymentTransactionId
      };
  @override
  List<Object?> get props => [
        
        partnerId,
        amount,
        reference,
        amount,
        currencyId,
        paymentType,
        journalId,
        paymentMethodLineId,
        paymentTransactionId
      ];
}




final class CreatePaymentResponseDto extends Equatable{
    final num paymentId;
  CreatePaymentResponseDto({required this.paymentId});

//the json['result'] for this result is a num
  factory CreatePaymentResponseDto.fromJson(dynamic json) {
    return CreatePaymentResponseDto(paymentId: json);
  }

   List<Object?> get props => [paymentId];
}