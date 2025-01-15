import 'package:flutter/material.dart';
import 'french_corner.dart';
import 'friend.dart';
import 'super_star.dart';
import 'abu_rateb.dart';

class HomepageInfo extends StatefulWidget {
  @override
  State<HomepageInfo> createState() => _HomepageInfoState();
}

class _HomepageInfoState extends State<HomepageInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FrenchCornerPage()));
              },
              child: Center(
                child: Image.asset('images/French corner.jpg'),
              ),
            ),
          ),
          Text(
            style: TextStyle(
              color: Colors.blueAccent,
            ),
            'Click above to see French Corner!'
          ),
          Padding(padding: EdgeInsets.all(7.5),),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/french corner Burger.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/french corner Torino.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/french corner Chicken sap.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
            width: 300.0,
            child: Divider(
              color: Colors.deepOrange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Friend()));
              },
              child: Center(child: Image.asset('images/Friend.jpg')),
            ),
          ),
          Text(
              style: TextStyle(
                color: Colors.blueAccent,
              ),
              'Click above to see Friend!'
          ),
          Padding(padding: EdgeInsets.all(7.5),),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/friend Chicken roast.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/friend Pizza.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/friend Soup.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
            width: 300.0,
            child: Divider(
              color: Colors.deepOrange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AbuRateb()));
                },
                child: Center(child: Image.asset('images/Abu rateb.jpg'))),
          ),
          Text(
              style: TextStyle(
                color: Colors.blueAccent,
              ),
              'Click above to see Abu Rateb!'
          ),
          Padding(padding: EdgeInsets.all(7.5),),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/abu rateb Shawarma.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/abu rateb Prosted.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/abu rateb Kibbeh.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
            width: 300.0,
            child: Divider(
              color: Colors.deepOrange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuperStar()));
                },
                child: Center(child: Image.asset('images/Super star.jpg'))),
          ),
          Text(
              style: TextStyle(
                color: Colors.blueAccent,
              ),
              'Click above to see Super Star!'
          ),
          Padding(padding: EdgeInsets.all(7.5),),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/super star Buffalo chicken.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/super star Burger.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'food_images/super star Zinger.jpg',
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
            width: 300.0,
            child: Divider(
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
