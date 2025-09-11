import 'package:cap04/App0401.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App0408());
}

class App0408 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factorial App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FactorialCalculator(),
    );
  }
}

class FactorialCalculator extends StatefulWidget {
  @override
  _FactorialCalculatorState createState() => _FactorialCalculatorState();
}

class _FactorialCalculatorState extends State<FactorialCalculator> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<String> results = [];

  void calculateFactorials() {
    setState(() {
      results.clear();
      for (int number in numbers) {
        int factorial = computeFactorial(number);
        results.add('El factorial de $number es: $factorial');
      }
    });
  }

  int computeFactorial(int n) {
    if (n == 0 || n == 1) return 1;
    return n * computeFactorial(n - 1);
  }

  @override
  void initState() {
    super.initState();
    calculateFactorials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factorial Calculator'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index]),
          );
        },
      ),
    );
  }
}
