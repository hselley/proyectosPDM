import 'package:flutter/material.dart';

void main() => runApp(App0900());

class App0900 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 100.0,
            left: 100.0,
            child: Container(
              width: 50.0,
              height: 50.0,
              color: Colors.black,
            ),
          ),
          Positioned(
            top: 120.0,
            left: 120.0,
            child: Container(
              width: 25.0,
              height: 25.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
