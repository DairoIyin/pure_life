import 'package:equatable/equatable.dart';

final class ProductResponseDto extends Equatable {
  final List<ProductItem> products;
  const ProductResponseDto({required this.products});

  factory ProductResponseDto.fromJson(dynamic json) {
    return switch (json) {
      final List list? => ProductResponseDto(
          products: list
              .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
              .toList()),
      _ => const ProductResponseDto(products: []),
    }; 
  }

  @override
  List<Object?> get props => [products];
}

final class ProductItem extends Equatable {
  final num id;
  final String name;
  final num price;
  final bool canBePurchased;
  final num quantity;
  final bool canBeSold;
  final String description;
  final String imageInBinary;
  final String createdDate;

  ProductItem({
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

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
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
