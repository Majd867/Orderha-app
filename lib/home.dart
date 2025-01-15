import 'package:flutter/material.dart';
import 'homePage_info.dart';
import 'profile.dart';
import 'search.dart';
import 'cart.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text(
            'Orderha',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              fontFamily: 'Lobster',
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepOrange,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        selectedItemColor: Colors.white, // Sets selected label and icon color
        unselectedItemColor: Colors.grey.shade800, // Sets unselected label and icon color
        selectedLabelStyle: TextStyle(
          fontSize: 19.0, // Change selected label font size
          fontWeight: FontWeight.bold, // Make the selected label bold
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14, // Change unselected label font size
          fontWeight: FontWeight.normal, // Normal weight for unselected label
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 40.0,
            ), label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 40,
            ), label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 40.0,
                color: Colors.white,
              ), label: 'Cart'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 40.0,
              color: Colors.white,
            ), label: 'Profile',

          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Center(child: HomePage()),
          Center(child: Search()),
          Center(child: Cart()),
          Center(child: Profile()),
        ],
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomepageInfo();
  }
}
