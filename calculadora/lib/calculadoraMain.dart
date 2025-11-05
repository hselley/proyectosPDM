import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';
  String? operand1;
  String? operator;
  bool isNewOperation = true;

  void inputNumber(String number) {
    setState(() {
      if (isNewOperation) {
        display = number;
        isNewOperation = false;
      } else {
        if (display == '0') {
          display = number;
        } else {
          display += number;
        }
      }
    });
  }

  void inputDot() {
    setState(() {
      if (isNewOperation) {
        display = '0.';
        isNewOperation = false;
      } else if (!display.contains('.')) {
        display += '.';
      }
    });
  }

  void clear() {
    setState(() {
      display = '0';
      operand1 = null;
      operator = null;
      isNewOperation = true;
    });
  }

  void setOperator(String op) {
    setState(() {
      if (operand1 == null) {
        operand1 = display;
      } else if (operator != null) {
        calculate();
      }
      operator = op;
      isNewOperation = true;
    });
  }

  void calculate() {
    if (operand1 != null && operator != null) {
      double num1 = double.parse(operand1!);
      double num2 = double.parse(display);
      double result;

      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '×':
          result = num1 * num2;
          break;
        case '÷':
          result = num1 / num2;
          break;
        default:
          return;
      }

      setState(() {
        display = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 10).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
        operand1 = null;
        operator = null;
        isNewOperation = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Pantalla
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                display,
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // Botones
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              children: [
                _buildButton('C', Colors.red, () => clear()),
                _buildButton('÷', Colors.orange, () => setOperator('÷')),
                _buildButton('×', Colors.orange, () => setOperator('×')),
                _buildButton('-', Colors.orange, () => setOperator('-')),
                _buildButton('7', Colors.grey, () => inputNumber('7')),
                _buildButton('8', Colors.grey, () => inputNumber('8')),
                _buildButton('9', Colors.grey, () => inputNumber('9')),
                _buildButton('+', Colors.orange, () => setOperator('+')),
                _buildButton('4', Colors.grey, () => inputNumber('4')),
                _buildButton('5', Colors.grey, () => inputNumber('5')),
                _buildButton('6', Colors.grey, () => inputNumber('6')),
                _buildButton('=', Colors.green, () => calculate()),
                _buildButton('1', Colors.grey, () => inputNumber('1')),
                _buildButton('2', Colors.grey, () => inputNumber('2')),
                _buildButton('3', Colors.grey, () => inputNumber('3')),
                _buildButton('0', Colors.grey, () => inputNumber('0')),
                _buildButton('.', Colors.grey, () => inputDot()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}