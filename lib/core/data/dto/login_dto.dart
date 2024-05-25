import 'package:equatable/equatable.dart';

class LoginRequestDto extends Equatable {
  LoginRequestDto({required this.email, required this.passWord});
  final String email;
  final String passWord;

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': passWord};
  }

  List<Object?> get props => [email, passWord];
}

final class LoginResponseDto extends Equatable {
  LoginResponseDto({required this.token, required this.partnerId});
  final String token;
  final num partnerId;

  factory LoginResponseDto.fromJson(dynamic json) {
    return LoginResponseDto(token: json['token']??'', partnerId: json['result']??0);
  }

  List<Object?> get props => [token, partnerId];
}
