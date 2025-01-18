import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orderha/model/Product.dart';


class ProductService {
  int id = 0;
  String apiUrl = 'http://10.0.2.2:8000/api/GetStoreProducts';
  ProductService(this.id) {
    apiUrl = 'http://10.0.2.2:8000/api/GetStoreProducts/$id';
  }

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
