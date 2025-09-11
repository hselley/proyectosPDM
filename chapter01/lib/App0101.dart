import 'package:flutter/material.dart';

main() {
  runApp(App0309());
}

class App0309 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Image"),
        ),
        body: Center(
          child: Image.asset('assets/MyImage.png'),
        ),
      ),
    );
  }
}