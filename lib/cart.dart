import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:orderha/controller/cart_controller.dart';
import 'package:orderha/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController _controller = CartController();
  late Future<List<CartModel>> _cartItems = Future.value([]);
  String? token;

  @override
  void initState() {
    super.initState();
    _initializeCart();
  }

  Future<void> _initializeCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('authToken');
    if (token != null) {
      _refreshCartItems();
    }
  }

  void _refreshCartItems() {
    setState(() {
      _cartItems = _controller.fetchCartItems(token!);
    });
  }

  Future<Map<String, dynamic>> _fetchProductDetails(int productId) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/ShowProduct/$productId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load product details');
    }
  }

  Future<void> _deleteItem(int itemId) async {
    await _controller.deleteCartItem(token!, itemId);
    _refreshCartItems();
  }

  Future<void> _clearCart() async {
    final items = await _cartItems;
    for (final item in items) {
      _deleteItem(item.id);
    }
    _refreshCartItems();
  }

  Future<void> _updateItemQuantity(int itemId, int newQuantity) async {
    await _controller.updateCartItemQuantity(token!, itemId, newQuantity);
    _refreshCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CartModel>>(
        future: _cartItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          } else {
            final cartItems = snapshot.data!;
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return FutureBuilder<Map<String, dynamic>>(
                  future: _fetchProductDetails(item.productId),
                  builder: (context, productSnapshot) {
                    if (productSnapshot.connectionState == ConnectionState.waiting) {
                      return const ListTile(
                        title: Text('Loading product details...'),
                      );
                    } else if (productSnapshot.hasError) {
                      return ListTile(
                        title: Text('Error loading product: ${productSnapshot.error}'),
                      );
                    } else {
                      final productDetails = productSnapshot.data!;
                      return Dismissible(
                        key: ValueKey(item.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) async {
                          await _deleteItem(item.id);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text('Product: ${productDetails['name']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Description: ${productDetails['description']}'),
                                Text('Price: \$${productDetails['price']}'),
                                Text('Quantity: ${item.quantity}'),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () async {
                                    if (item.quantity > 1) {
                                      await _updateItemQuantity(item.id, item.quantity - 1);
                                    }
                                  },
                                ),
                                Text('${item.quantity}'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () async {
                                    await _updateItemQuantity(item.id, item.quantity + 1);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () async {
                                    await _deleteItem(item.id);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.delete_sweep),
        onPressed: () async {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Clear Cart'),
              content: const Text('Are you sure you want to clear your cart?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _clearCart();
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
          );
          if (confirm == true) {
            await _clearCart();
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
          ),
          onPressed: () {
            // Implement "Order Now" functionality
          },
          child: const Text(
            'Order Now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
