import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  String _searchCategory = 'Product';
  List<String> products = [];
  List<String> stores = ['french corner', 'friend', 'abu rateb', 'super star'];
  List<String> searchResults = [];

  void _performSearch(String query) {
    setState(() {
      if (_searchCategory == 'Product') {
        searchResults = products
            .where((product) => product.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        searchResults = stores
            .where((store) => store.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
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
          child: Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search $_searchCategory',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _performSearch(_searchController.text);
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResults[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
