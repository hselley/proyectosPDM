import 'package:flutter/material.dart';

main() => runApp(App0301());

class App0301 extends StatelessWidget {
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Material(
        child: Center(
            child: Text("Hola mundo cruel",
              textScaler: TextScaler.linear(1),
              style: TextStyle(fontSize: 40),
            )),
      ),
    );
  }
}