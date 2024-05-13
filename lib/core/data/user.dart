import 'dart:convert';

class User {
  User(
      {required this.id,
      required this.email,
      required this.name,
      this.phoneNumber = '',
      this.contactAddress = ''});
  final String id;
  final String email;
  final String name;
  final String? phoneNumber;
  final String? contactAddress;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'contactAddress': contactAddress
    };
  }

  User copyWith({
    String? email,
    String? name,
    String? phoneNumber,
    String? contactAddress,
  }) {
    return User(
        id: id,
        email: email ?? this.email,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        contactAddress: contactAddress ?? this.contactAddress);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        contactAddress: json['contactAddress']);
  }
}
