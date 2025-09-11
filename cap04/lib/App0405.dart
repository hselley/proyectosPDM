import 'package:flutter/material.dart';

void main() => runApp(App0404());

class App0404 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My own art gallery"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              funcion("Hola mundo"),
              SizedBox(height: 40.0,),
              Text("7! = ${factorial(7)}"),
            ],
          ),
        ),
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

Widget funcion(String word) {
  return Center(child: Text(word));
}