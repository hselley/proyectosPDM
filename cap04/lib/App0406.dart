import 'package:flutter/material.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];
// final List<int> colorCodes = <int>[for (int i = 1; i <= 3; i++) 10*i];
// final List<int> colorCodes = <int>[for (int i = 600; i >= 100; i=i-100) i];

main() => runApp(App0406());

class App0406 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
          AppBar(title: Text("ListView builder demo"),),
        body:
          ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              }
          ),
      ),
    );
  }
}

