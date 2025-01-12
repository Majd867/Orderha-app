import 'dart:io';
import 'package:flutter/material.dart';
import 'log_in.dart';
import 'history.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  //method to apply logging out from backend
  void logOut(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logged out successfully!')),);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogIn())
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
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor : Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                logOut(context);
              },
              child: Text('Yes', style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }
  //Variables that needs to be taken from the data base:
  String firstName = '';
  String lastName = '';
  String location = '';
  String phoneNumber = '';
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: profileImage != null
                  ? FileImage(profileImage!)
                  : null,
              child: profileImage == null
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
              leading: Icon(Icons.person,
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
              leading: Icon(Icons.person,
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
              leading: Icon(Icons.phone,
                color: Colors.white,

              ),
              title: Text(
                "Your Phone number: $phoneNumber",
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
              leading: Icon(Icons.location_pin,
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
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => History(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.history,
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
                onPressed: (){
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
    );
  }
}
