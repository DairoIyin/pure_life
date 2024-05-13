import 'package:equatable/equatable.dart';

final class DeliveryResponseDto extends Equatable {
  final List<DeliveryItem> deliveryLocations;
  const DeliveryResponseDto({required this.deliveryLocations});

  factory DeliveryResponseDto.fromJson(dynamic json) {
    return switch (json) {
      final List list? => DeliveryResponseDto(
          deliveryLocations: list
              .map((e) => DeliveryItem.fromJson(e as Map<String, dynamic>))
              .toList()),
      _ => const DeliveryResponseDto(deliveryLocations: []),
    }; 
  }

  @override
  List<Object?> get props => [deliveryLocations];
}

final class DeliveryItem extends Equatable {
  final num id;
  final String name;
  final num price;
  final bool canBePurchased;
  final num quantity;
  final bool canBeSold;
  final String description;
  final String imageInBinary;
  final String createdDate;

  DeliveryItem({
    required this.id,
    required this.name,
    required this.price,
    required this.canBePurchased,
    required this.quantity,
    required this.canBeSold,
    required this.description,
    required this.imageInBinary,
    required this.createdDate,
  });

  factory DeliveryItem.fromJson(Map<String, dynamic> json) {
    return DeliveryItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      canBePurchased: json['canBePurchased'] ?? true,
      quantity: json['quantity'] ?? 0,
      canBeSold: json['canBeSold'] ?? true,
      description: json['description'] ?? '',
      imageInBinary: json['imageInBinary'] ?? '',
      createdDate: json["createdDate"] ?? '',
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        price,
        canBePurchased,
        quantity,
        canBeSold,
        description,
        description,
        imageInBinary,
        createdDate
      ];
}
