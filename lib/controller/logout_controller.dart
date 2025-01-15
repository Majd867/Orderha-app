import 'package:http/http.dart' as http;

class LogoutController {
  Future<void> logout() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/Logout');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer 1|EYiLFn2qYdVV528KnMxALWCu3tg3JqfgldJDTO068cd91461',
      },
    );

    if (response.statusCode == 200) {
      print('Logout successful');
    } else {
      print('Failed to logout');
    }
  }
}
