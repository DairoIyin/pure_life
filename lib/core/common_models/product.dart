

class Product {
  Product(
      {required this.id,
      required this.price,
      required this.image,
      required this.title,
      this.description,
      this.quantityInDrug,
      this.weight
      });
  final String id;
  final String image;
  final num price;
  final String title;
  String? description;
  String? quantityInDrug;
  String? weight;

 // String get naira => '${Strings.naira}$price';
}


