import 'package:flutter/material.dart';
import 'create_account.dart';
class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CreateAccountPageState yourAccount = CreateAccountPageState();
  //method to apply logging out from backend
  void logOut(){

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: yourAccount.profileImage != null
                  ? FileImage(yourAccount.profileImage!) // Display selected image
                  : null,
              child: yourAccount.profileImage == null
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
                "Your Fisrt name: ${yourAccount.firstName}",
                style: TextStyle(
                  fontSize: 19.0,
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
                "Your Last name: ${yourAccount.lastName}",
                style: TextStyle(
                  fontSize: 19.0,
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
                "Your Phone number: ${yourAccount.phone}",
                style: TextStyle(
                  fontSize: 19.0,
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
                "Your Location: ${yourAccount.location}",
                style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.white,
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
                  logOut();
                },
                child: Text(
                  'Log out  ',
                  style: TextStyle(
                    fontSize: 25.0,
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
