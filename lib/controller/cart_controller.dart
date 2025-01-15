import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orderha/model/cart_item.dart';
import 'package:orderha/model/cart_model.dart';

class CartController {
  static const String _baseUrl = 'http://127.0.0.1:8000/api/AddToCart';

  Future<bool> addToCart(CartItem item, String token) async {
    final url = Uri.parse(_baseUrl);
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: item.toMap(),
      );

      if (response.statusCode == 200) {
        print('Added to cart successfully');
        return true;
      } else {
        print('Failed to add to cart: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
  final String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<CartModel>> fetchCartItems(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/ShowCartItems'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => CartModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  Future<void> updateCartItemQuantity(String token, int cartItemId, int quantity) async {
    final response = await http.put(
      Uri.parse('$baseUrl/UpdateCartItem/$cartItemId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: {'quantity': quantity.toString()},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update cart item');
    }
  }

  Future<void> deleteCartItem(String token, int cartItemId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/DeleteCartItem/$cartItemId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete cart item');
    }
  }
}
