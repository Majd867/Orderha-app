import 'package:flutter/material.dart';
import 'product.dart';

class Friend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrange,
        title: Expanded(
          child: Center(
            child: Text(
              'Friend         ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 27.0,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FriendPage(),
        ),
      ),
    );
  }
}

class FriendPage extends StatefulWidget {
  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  String productName = '';
  String productPrice = '';
  String imageUrl = '';

  void goToProductInfo(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Product()));
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(child: Image.asset('images/Friend.jpg')),
        ),
        Text(
          'Our Menu:',
          style: TextStyle(
            fontFamily: 'Lobster',
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Image.asset(
                  'food_images/friend Chicken roast.jpg',
                  width: 140.0,
                  height: 140.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Image.asset(
                  'food_images/friend Soup.jpg',
                  width: 140.0,
                  height: 140.0,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {goToProductInfo();},
              child: Text(
                '   Chicken roasto.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {goToProductInfo();},
              child: Text(
                'Mushroom Soup.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Image.asset(
                  'food_images/friend Pizza.jpg',
                  width: 140.0,
                  height: 140.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Image.asset(
                  'food_images/friend Crispy wajbe.jpg',
                  width: 140.0,
                  height: 140.0,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {goToProductInfo();},
              child: Text(
                '  Pepperoni Pizza.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {goToProductInfo();},
              child: Text(
                'Crispy Meal.      ',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
