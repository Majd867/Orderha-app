class CartModel {
  final int id;
  final int userId;
  final int productId;
  final int quantity;
  final double price;

  CartModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.price,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
    );
  }
}
