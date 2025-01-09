import 'package:flutter/material.dart';

class AbuRateb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrange,
        title: Expanded(
          child: Center(
            child: Text(
              'Abu Rateb         ',
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
          child: AbuRatebPage(),
        ),
      ),
    );
  }
}

class AbuRatebPage extends StatefulWidget {
  @override
  State<AbuRatebPage> createState() => _AbuRatebPageState();
}

class _AbuRatebPageState extends State<AbuRatebPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(child: Image.asset('images/Abu rateb.jpg')),
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
                  'food_images/abu rateb Burger.jpg',
                  width: 140.0,
                  height: 140.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Image.asset(
                  'food_images/abu rateb Kibbeh.jpg',
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
                'Syrian Kibbeh.    ',
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
                  'food_images/abu rateb Prosted.jpg',
                  width: 140.0,
                  height: 140.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Image.asset(
                  'food_images/abu rateb Shawarma.jpg',
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
                '   Chicken Prosted.',
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
                'Shawarma Meal.  ',
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
