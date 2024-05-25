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
  final dynamic imageInBinary;
  num quantity;

  ProductItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageInBinary,
      this.quantity = 1});

  factory ProductItem.empty() {
    return ProductItem(id: 0, name: '', price: 0, imageInBinary: '');
  }
  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['lst_price'] ?? 0,
      imageInBinary: json['image_1024'] ?? '',
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        price,
        imageInBinary,
      ];
}
