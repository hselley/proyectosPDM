import 'package:flutter/material.dart';

void main() => runApp(App0404());

class App0404 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(highlight("Look at me")),
            Text("7! = ${factorial(7)}", textScaler: TextScaler.linear(2)),
          ],
        )),
      ),
    );
  }
}

String highlight(String words) {
  return "*** $words ***";
}

String factorial(int n) {
  double f=1;
  for(int i=1; i<=n; i++)
    f*=i;
  return(f.toString());
}
