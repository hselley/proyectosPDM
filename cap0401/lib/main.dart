import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                height: 50,
                color: Colors.blue[600],
                child: Center(
                    child: Text("5! = ${factorialRecursivo(5)}",
                      style: const TextStyle(fontSize: 35),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                color: Colors.blue[400],
                child: Center(
                    child: Text("4! = ${factorialRecursivo(4)}",
                      style: const TextStyle(fontSize: 35),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                color: Colors.blue[200],
                child: Center(
                    child: Text("3! = ${factorialRecursivo(3)}",
                      style: const TextStyle(fontSize: 35),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                color: Colors.blue[100],
                child: Center(
                    child: Text("2! = ${factorialRecursivo(2)}",
                      style: const TextStyle(fontSize: 35),
                    )),
              ),
            ]),
      ),
    );
  }
}

highlight(words) {
  return "*** $words ***";
}

double factorialRecursivo(int n) {
  if(n==0 || n==1)
    return(1);
  else
    return n*factorialRecursivo(n-1);
}