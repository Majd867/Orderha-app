import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // To handle JSON in Dart
import 'package:shared_preferences/shared_preferences.dart'; // لقراءة الـ token من SharedPreferences
import 'log_in.dart';
import 'history.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String firstName = '';
  String lastName = '';
  String phone = '';
  String location = '';
  String profileImageUrl = '';


  // Method to fetch user data
  Future<void> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken'); // استرجاع التوكن من SharedPreferences

    if (token == null) {
      throw Exception('User not authenticated');
    }

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/GetUser'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // If the response is successful
      final data = json.decode(response.body);
      print(data);
      setState(() {
        firstName = data['first_name'];
        lastName = data['last_name'];
        phone = data['phone'];
        location = data['location'];
        profileImageUrl = data['profile_image'] ?? ''; // If profile image is null
      });
    } else {
      // If the response fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load user data')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Fetch user data when the page loads
  }

  void logOut(BuildContext context) async {
    // Placeholder for logout functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logged out successfully!')),
    );
    // حذف التوكن من الـ SharedPreferences عند تسجيل الخروج
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken'); // حذف التوكن
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LogIn()), // الانتقال إلى صفحة تسجيل الدخول
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Do you really want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                logOut(context); // Perform logout action
              },
              child: Text('Yes', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: profileImageUrl.isNotEmpty
                    ? NetworkImage(profileImageUrl) // If profile image exists
                    : null,
                child: profileImageUrl.isEmpty
                    ? Icon(
                  Icons.person,
                  size: 140,
                  color: Colors.grey[700],
                )
                    : null,
              ),
            ),
            Card(
              color: Colors.deepOrange,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Your First name: $firstName",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.deepOrange,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Your Last name: $lastName",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.deepOrange,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                title: Text(
                  "Your Phone number: $phone",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.deepOrange,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.location_pin,
                  color: Colors.white,
                ),
                title: Text(
                  "Your Location: $location",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90.0,
              child: Card(
                color: Colors.deepOrange,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => History(),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Click to see your orders history.",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  child: Text(
                    'Log out  ',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
