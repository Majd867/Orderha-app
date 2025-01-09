import 'package:flutter/material.dart';

class FrenchCorner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrange,
        title: Expanded(
          child: Center(
            child: Text(
              'French Corner         ',
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
          child: FrenchCornerPage(),
        ),
      ),
    );
  }
}

class FrenchCornerPage extends StatefulWidget {
  @override
  State<FrenchCornerPage> createState() => _FrenchCornerPageState();
}

class _FrenchCornerPageState extends State<FrenchCornerPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Image.asset('images/French corner.jpg'),
          ),
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
                  'food_images/french corner Burger.jpg',
                  width: 140.0,
                  height: 140.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Image.asset(
                  'food_images/french corner Torino.jpg',
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
              onPressed: () {},
              child: Text(
                '  Burger Sandwich.',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Torino Sandwich.',
                style: TextStyle(
                  fontSize: 20.0,
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
                  'food_images/french corner Chicken sap.jpg',
                  width: 140.0,
                  height: 140.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Image.asset(
                  'food_images/french corner Crispy Meal.jpg',
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
              onPressed: () {},
              child: Text(
                '      Chicken Sap.',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Crispy Meal.      ',
                style: TextStyle(
                  fontSize: 20.0,
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
