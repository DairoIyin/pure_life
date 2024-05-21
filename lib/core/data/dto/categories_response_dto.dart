import 'package:equatable/equatable.dart';

final class CategoriesResponseDto extends Equatable {
  final List<CategoryItem> categories;
  const CategoriesResponseDto({required this.categories});

  factory CategoriesResponseDto.fromJson(dynamic json) {
    return switch (json) {
      final List list? => CategoriesResponseDto(
          categories: list
              .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
              .toList()),
      _ => const CategoriesResponseDto(categories: []),
    };
  }

  @override
  List<Object?> get props => [categories];
}

final class CategoryItem extends Equatable {
  final num id;
  final String name;

  CategoryItem({
    required this.id,
    required this.name,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
  @override
  List<Object?> get props => [id, name];
}
