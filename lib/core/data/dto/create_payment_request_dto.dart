import 'package:equatable/equatable.dart';

final class CreateandInitiateRequestDto extends Equatable {
  final num partnerId;
  final num amount;
  final num currencyId;
  final String paymentType;
  final num journalId;
  final num paymentMethodLineId;
  final String reference;

  final String email;
  final num acquirerId;
  final List<SalesIds> salesOrderIds;

  CreateandInitiateRequestDto({
    required this.journalId,
    required this.partnerId,
    required this.reference,
    required this.amount,
    required this.currencyId,
    required this.paymentMethodLineId,
    required this.acquirerId,
    required this.email,
    required this.salesOrderIds,
    required this.paymentType,
  });

  Map<String, dynamic> toJson() => {
        'partnerId': partnerId,
        'amount': amount,
        'currencyId': currencyId,
        'paymentType': paymentType,
        'journalId': journalId,
        'paymentMethodLineId': paymentMethodLineId,
        'reference': reference,
        'email': email,
        'acquirerId': acquirerId,
        'salesOrderIds': salesOrderIds
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
        email,
        acquirerId,
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

final class CreateandInitiateResponseDto extends Equatable {
  final String paystackChechoutLink;
  CreateandInitiateResponseDto({required this.paystackChechoutLink});

//the json['result'] for this result is a num
  factory CreateandInitiateResponseDto.fromJson(dynamic json) {
    return CreateandInitiateResponseDto(paystackChechoutLink: json['data']['authorization_url']??'');
  }

  List<Object?> get props => [paystackChechoutLink];
}
