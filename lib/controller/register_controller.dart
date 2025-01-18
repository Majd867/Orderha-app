import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:orderha/model/register_model.dart';

class UserController {
  Future<void> register(UserModel user) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/Register');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
      },
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      print('User registered successfully');
    } else {
      print('Failed to register user');
    }
  }
}
