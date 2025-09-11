import 'package:flutter/material.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

void main() => runApp(App0406());

class App0406 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            // Asegúrate de que el índice esté dentro del rango válido
            if (index < colorCodes.length) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            } else {
              // Maneja el caso cuando el índice está fuera del rango
              return Container(
                height: 50,
                color: Colors.grey[300],
                child: Center(child: Text('Invalid index')),
              );
            }
          },
        ),
      ),
    );
  }
}
