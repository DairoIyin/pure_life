import 'package:equatable/equatable.dart';

final class ValidatePaymentRequestDto extends Equatable {
  final num paymentId;
 

  const ValidatePaymentRequestDto(
      {required this.paymentId});

  Map<String, dynamic> toJson() {
    return {
      'paymentId': paymentId,
      
    };
  }

  @override
  List<Object?> get props => [paymentId];
}


