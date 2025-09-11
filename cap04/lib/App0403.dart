import 'package:flutter/material.dart';

main() {
  runApp(App0403());
}

class App0403 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(child: Text(highlight("Look at me"))),
      ),
    );
  }
}

highlight(words) => "*** $words ***";
