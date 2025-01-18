import 'package:http/http.dart' as http;
import 'package:orderha/auth_token.dart';
import 'dart:convert';

import 'package:orderha/model/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Future<http.Response> login(LoginRequest request) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/Login');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
      },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['success']) {
        final token = responseData['0'];
        await storeToken(token);
      }
    }
    return response;
  }
}

// تخزين التوكن في SharedPreferences
Future<void> storeToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token); // تخزين التوكن في SharedPreferences
}

// استرجاع التوكن من SharedPreferences
Future<String?> retrieveToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token');
}

