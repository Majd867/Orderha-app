import 'package:flutter/material.dart';
import 'package:orderha/controller/cart_controller.dart';
import 'package:orderha/model/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductPage extends StatefulWidget {
  final String productDescription;
  final String productName;
  final String productPrice;
  final String imageUrl;
  final int productId;

  const ProductPage({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
    required this.productId,
    required this.productDescription,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int counter = 1;
  bool _isLoading = false;
  late String? _token = '2|b1TLb8EyuvmDKklX6FeRSWdamZoZmYPrkDAgsoqGaefda207';

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      counter = 1;
    });
  }

  Future<void> _addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = true;
    });
    _token = prefs.getString('authToken');
    final cartItem = CartItem(productId: widget.productId, quantity: counter);
    final success = await CartController().addToCart(cartItem, _token!);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added to cart!')),
      );
      _resetCounter();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add to cart.')),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abu Rateb'),
        centerTitle: true,
      ),
      body: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Image.asset(
              widget.imageUrl,
              height: 260,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Text(widget.productName, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text(widget.productDescription, style: TextStyle(fontSize: 20)),
            Text(widget.productPrice, style: TextStyle(fontSize: 16, color: Colors.green)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Quantity: '),
                Text('$counter', style: TextStyle(fontSize: 20)),
                IconButton(icon: Icon(Icons.add), onPressed: _incrementCounter),
                TextButton(onPressed: _resetCounter, child: Text('Reset')),
              ],
            ),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _addToCart,
              child: Text('Add To Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
