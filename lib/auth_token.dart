import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _key = 'auth_token';


  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
  }


  Future<String?> retrieveToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }


  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
