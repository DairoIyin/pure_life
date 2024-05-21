import 'package:equatable/equatable.dart';

final class Payment extends Equatable {
  final String userId;
  final String userEmail;
  final num amount;

  Payment({
    required this.userId,
    required this.userEmail,
    required this.amount,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userEmail': userEmail,
        'amount': amount,
      };
  @override
  List<Object?> get props => [
       userId,userEmail,amount
      ];
}
