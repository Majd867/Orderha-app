import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:orderha/model/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Future<http.Response> login(LoginRequest request) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/Login');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer 3|vl8kAjjYIyQKwF9zQJvwf396aNNVofXYwUP1fWDkcf4fc7e8',
      },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['success']) {
        final token = responseData['0'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', token);
      }
    }

    return response;
  }
}


