import 'package:equatable/equatable.dart';

final class UserPartnerResponseDto extends Equatable {
  UserPartnerResponseDto({required this.userPartners});
  final List<UserPartner> userPartners;

  factory UserPartnerResponseDto.fromJson(dynamic json) => switch (json) {
        final List list? => UserPartnerResponseDto(
            userPartners: list
                .map((e) => UserPartner.fromJson(e as Map<String, dynamic>))
                .toList()),
        _ => UserPartnerResponseDto(userPartners: [])
      };

  List<Object?> get props => [userPartners];
}

final class UserPartner extends Equatable {
  final num id;
  final List partnerId;

  UserPartner({required this.id, required this.partnerId});

  factory UserPartner.fromJson(Map<String, dynamic> json) {
    return UserPartner(id: json['id'], partnerId: json['partner_id']);
  }

  List<Object?> get props => [id, partnerId];
}
