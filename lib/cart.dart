import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  //variables from the backend
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //orders from the backend
        Expanded(
          child: Center(
            child: Container(
              color: Colors.white,
              height: 62.0,
              width: 200.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {

                },
                child: Text(
                  'Order now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
