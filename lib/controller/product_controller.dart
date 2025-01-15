import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orderha/model/Product.dart';


class ProductService {
  final String apiUrl = 'http://127.0.0.1:8000/api/ShowProducts';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
