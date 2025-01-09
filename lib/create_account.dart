import 'package:flutter/material.dart';
import 'home.dart';
import 'package:orderha/home.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CreateAccountPage(),
          ),
        ),
      );
  }
}
class CreateAccountPage extends StatefulWidget {


  @override
  State<CreateAccountPage> createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedImage != null) {
      setState(() {
        profileImage = File(pickedImage.path);
      });
    }
  }

  String firstName = '';
  String lastName = '';
  String phone = '';
  String location = '';
  File? profileImage;
  String password = '';
  void _createAccount() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('First Name: $firstName');
      print('Last Name: $lastName');
      print('Phone: $phone');
      print('Location: $location');
      print('Password: $password');
      Navigator.push(
        context,
            MaterialPageRoute(builder:(context) => Home()),
      );
    }
  }

      @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                child: Icon(Icons.arrow_back),
                onPressed: (){
                Navigator.pop(context);
                },
               ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                'Create new account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: _pickImage, // Trigger image picker on tap
              child: CircleAvatar(
                radius: 60,
                backgroundImage: profileImage != null
                    ? FileImage(profileImage!) // Display selected image
                    : null,
                child: profileImage == null
                    ? Icon(
                  Icons.camera_alt,
                  size: 35,
                  color: Colors.grey[700],
                )
                    : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                hintText: 'Enter your First name',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
              onSaved: (value) {
                firstName = value!;
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                hintText: 'Enter your Last name',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
              onSaved: (value) {
                lastName = value!;
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                hintText: 'Enter your Phone number',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.length != 10) {
                  return 'Please enter a valid 10-digit phone number';
                }
                return null;
              },
              onSaved: (value) {
                phone = value!;
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_pin),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Location',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Location';
                  }
                  return null;
                },
                onSaved: (value) {
                  location = value!;
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                hintText: 'Create Password',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
              onSaved: (value) {
                password = value!;
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(
              color: Colors.deepOrange,
              height: 62.0,
              width: 200.0,
              child: ElevatedButton(
                  onPressed: () {
                    _createAccount();
                  },
                  child: Text(
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    'Create',
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 400.0,
            ),
          ),
        ],

      ),
    );

  }
}
