import 'package:flutter/material.dart';
import 'log_in.dart';
LogIn logIn = LogIn();
void main() {
  runApp(orderhaApp());
}

class orderhaApp extends StatefulWidget {
  @override
  State<orderhaApp> createState() => _orderhaAppState();
}

class _orderhaAppState extends State<orderhaApp> {
  @override
  Widget build(BuildContext context) {
    return logIn;
  }
}

