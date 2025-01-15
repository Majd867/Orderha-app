import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orderha/model/SearchResult.dart';

class SearchController {
  final String apiUrl = "http://127.0.0.1:8000/api/Search";

  Future<List<SearchResult>> performSearch({
    required String query,
    required String type,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.fields['name'] = query;
      request.fields['type'] = type;

      var response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final List<dynamic> jsonList = json.decode(responseData);
        return jsonList.map((json) => SearchResult.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch search results');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
