import 'dart:convert';
import 'package:http/http.dart' as http;

class user {
  final String apiUrl = "http://100.127.255.249:8000/api/GetUser";

  Future<List> getResponse() async {
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("service error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
