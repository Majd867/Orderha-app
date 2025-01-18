import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:orderha/model/SearchResult.dart';
import 'package:orderha/abu_rateb.dart';
import 'package:orderha/french_corner.dart';
import 'package:orderha/friend.dart';
import 'package:orderha/product.dart';
import 'package:orderha/super_star.dart';

class SearchController {
  final String apiUrl = "http://10.0.2.2:8000/api/Search";

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

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  final SearchController _searchControllerAPI = SearchController();
  String _searchCategory = 'Product';
  List<SearchResult> searchResults = [];
  bool isLoading = false;

  void _performSearch() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Fetch results from the API
      final results = await _searchControllerAPI.performSearch(
        query: _searchController.text,
        type: _searchCategory.toLowerCase(),
      );

      // Additional frontend filtering to ensure accurate results
      setState(() {
        searchResults = results
            .where((result) => result.name
            .toLowerCase()
            .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _navigateToDetails(SearchResult result) {
    if (_searchCategory.toLowerCase() == 'product') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductPage(
            imageUrl: result.imageUrl,
            productId: result.id,
            productName: result.name,
            productPrice: result.price?.toString() ?? 'N/A',
            productDescription: result.description,
          ),
        ),
      );
    } else if (_searchCategory.toLowerCase() == 'store') {
      if (result.id == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FrenchCornerPage(),
          ),
        );
      } else if (result.id == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Friend(),
          ),
        );
      } else if (result.id == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AbuRateb(),
          ),
        );
      } else if (result.id == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuperStar(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: DropdownButton<String>(
            value: _searchCategory,
            onChanged: (value) {
              setState(() {
                _searchCategory = value!;
                _searchController.clear();
                searchResults.clear();
              });
            },
            items: [
              DropdownMenuItem(
                value: 'Product',
                child: Text('Product'),
              ),
              DropdownMenuItem(
                value: 'Store',
                child: Text('Store'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search $_searchCategory',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: _performSearch,
              ),
            ),
          ),
        ),
        if (isLoading)
          CircularProgressIndicator()
        else
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final result = searchResults[index];
                return InkWell(
                  onTap: () => _navigateToDetails(result),
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: result.imageUrl.isNotEmpty
                          ? Image.network(
                        result.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image, size: 50);
                        },
                      )
                          : Icon(Icons.image_not_supported, size: 50),
                      title: Text(result.name),
                      subtitle: Text(result.description),
                      trailing: result.price != 0
                          ? Text(
                        '\$ ${result.price}',
                        style: TextStyle(color: Colors.green),
                      )
                          : Text(""),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

