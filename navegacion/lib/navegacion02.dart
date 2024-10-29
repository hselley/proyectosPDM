/// Navegación entre pantallas pasando parámetros
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pantalla1(),
    );
  }
}

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla1"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Pantalla2(parametro: "Mensaje desde pantalla 1",)));
          },
          child: Text("Ir a pantalla 2"),
        ),
      ),
    );
  }
}

class Pantalla2 extends StatelessWidget {
  final String parametro;
  const Pantalla2({super.key, required this.parametro});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Pantalla 2"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(parametro, textScaler: TextScaler.linear(2),),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Regresar a pantalla 1")
              ),
            ],
          ),
        )
    );
  }
}