import 'package:equatable/equatable.dart';

final class DeliveryResponseDto extends Equatable {
  final List<DeliveryItem> deliveryItems;
  const DeliveryResponseDto({required this.deliveryItems});

  factory DeliveryResponseDto.fromJson(dynamic json) {
    return switch (json) {
      final List list? => DeliveryResponseDto(
          deliveryItems: list
              .map((e) => DeliveryItem.fromJson(e as Map<String, dynamic>))
              .toList()),
      _ => const DeliveryResponseDto(deliveryItems: []),
    };
  }

  @override
  List<Object?> get props => [deliveryItems];
}

final class DeliveryItem extends Equatable {
  final num id;
  final String name;
  final num price;
  num quantity;

  DeliveryItem(
      {required this.id,
      required this.name,
      required this.price,
      this.quantity = 1});

  factory DeliveryItem.empty() {
    return DeliveryItem(id: 0, name: '', price: 0,);
  }
  factory DeliveryItem.fromJson(Map<String, dynamic> json) {
    return DeliveryItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['lst_price'] ?? 0,
      
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        price,
     
      ];
}
