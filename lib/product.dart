import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:orderha/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:orderha/product.dart';
class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Product info        ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 27.0,
            ),
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String productName = '';
  String productPrice = '';
  String imageUrl = '';
  int id = 0;
  int counter = 1;
  int counterValue() {
    setState(() {
      counter++;
    });
    return counter;
  }
  int counterReset(){
    setState(() {
      counter = 1;
    });
    return counter;
  }

  ProductInfo addToCart(int id ,int counter){
    return ProductInfo(id, counter);
  }

  bool _showCheckIcon = false;
  void onButtonPressed() async{
    setState(() {
      _showCheckIcon = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _showCheckIcon = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  productPrice,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quantinty:   ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              Text(
                counter.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              TextButton(
                onPressed: () {
                  counterValue();
                },
                child: Icon(
                  Icons.add,
                ),
              ),
              TextButton(
                onPressed: (){
                  counterReset();
                },
                child: Text('Reset',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SizedBox(
                height: 62.0,
                width: 200.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    onButtonPressed();
                    addToCart(id, counter);
                    counterReset();
                  },
                  child: _showCheckIcon
                    ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 40.0,
                      )
                    : Text(
                    'Add To Cart.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
