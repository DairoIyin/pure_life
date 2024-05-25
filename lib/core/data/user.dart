import 'dart:convert';

class User {
  User(
      {required this.email,
      required this.name,
      required this.partnerId,
      this.phoneNumber = '',
      this.contactAddress = ''});

  final String email;
  final String name;
  final num partnerId;
  final String? phoneNumber;
  final String? contactAddress;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'partnerId':partnerId,
      'phoneNumber': phoneNumber,
      'contactAddress': contactAddress
    };
  }

  User copyWith({
    String? email,
    String? name,
    String? phoneNumber,
    String? contactAddress,
    num? partnerId,
  }) {
    return User(
        email: email ?? this.email,
        name: name ?? this.name,
        partnerId:partnerId ??-1,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        contactAddress: contactAddress ?? this.contactAddress);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        name: json['name'],
        partnerId: json['partnerId'],
        phoneNumber: json['phoneNumber'],
        contactAddress: json['contactAddress']);
  }
}
