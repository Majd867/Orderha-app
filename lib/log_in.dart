import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:orderha/controller/login_controller.dart';
import 'package:orderha/home.dart';
import 'package:orderha/model/loginModel.dart';
import 'create_account.dart';
import 'home.dart';


CreateAccount createAccount = CreateAccount();

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LoginPage(),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = LoginController(); // Instantiate the controller
  String phone = '';
  String password = '';
  String _message = "Sign in";

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final request = LoginRequest(
        phone: phone,
        password: password,
      );
      final response = await _loginController.login(request); // Use the controller to login

      if (response.statusCode == 200) {
        setState(() {
          _message = 'Signed in Successfully!';
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        final responseData = json.decode(response.body);
        setState(() {
          _message = responseData['error'] ?? 'Failed to login. Please check your credentials and try again.';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_message)),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Orderha',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                  fontFamily: 'Lobster',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Text(
          'Sign in',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
                onSaved: (value) => phone = value!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                onSaved: (value) => password = value!,
              ),
            ),
            Container(
              color: Colors.deepOrange,
              height: 62.0,
              width: 200.0,
              child: ElevatedButton(
                onPressed: () {
                  _signIn();
                },
                child: Text(
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  _message,
                ),
              ),
            ),
          ]),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateAccount()),
            );
          },
          child: Text(
              'I don\'t have an account? Sign up',
          ),
        ),
        SizedBox(
          height: 70.0,
        ),
      ],
    );
  }
}
