class CartItem {
  CartItem(
      {required this.amount,
      required this.description,
       this.quantity=1,
      required this.title,
      required this.weight});
  String title;
  String description;
  String weight;
  num amount;
  int quantity;

 
}
