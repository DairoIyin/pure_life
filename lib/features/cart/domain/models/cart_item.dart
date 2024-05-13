class CartItemModel {
  CartItemModel({
    required this.productId,
    required this.cartId,
    required this.quantity,
  });
  final num productId;
  final String cartId;
  final num quantity;
}
