// App06Main.dart
import 'package:flutter/material.dart';
import 'App0613.dart';

void main() => runApp(App06Main());

class App06Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[400],
      child: Padding(padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ), child: buildColumn(context),
      ),
    );
  }
}

Widget buildTitleText() {
  return const Text(
    "My Pet Shop",
    textScaler: TextScaler.linear(3),
    textAlign: TextAlign.center,
  );
}

Widget buildRoundedBox(String label, {double height = 88.0}) {
  return Container(
    height: height,
    width: 88.0,
    alignment: const Alignment(0.0, 0.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black),
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      )
    ),
    child: Text(label, textAlign: TextAlign.center,),
  );
}











