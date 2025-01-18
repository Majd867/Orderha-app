import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../auth_token.dart';

class UserController {



  final String apiUrl = "http://10.0.2.2:8000/api/";
  Future<String?> retrieveToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<Map<String, dynamic>> fetchProfile() async {
    try {
      String? token = await retrieveToken();
      final response = await http.get(Uri.parse('$apiUrl/GetUser'),headers: {
        'Authorization': 'Bearer $token',
      },);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      else {
        throw Exception('Failed to fetch profile');
      }
    } catch (e) {
      throw Exception('Error fetching profile: $e');
    }
  }



}
