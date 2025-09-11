import 'package:flutter/material.dart';

main() => runApp(App0402());

class App0402 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(child: Text(highlight("Look at me"))),
      ),
    );
  }
}

highlight(words) {
  return "*** " + words + " ***";
}
