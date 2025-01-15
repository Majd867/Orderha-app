class CartItem {
  final int productId;
  final int quantity;

  CartItem({required this.productId, required this.quantity});

  Map<String, String> toMap() {
    return {
      'product_id': productId.toString(),
      'quantity': quantity.toString(),
    };
  }
}
