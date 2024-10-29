/// Navegación entre pantallas con rutas nombradas y paso de parámetros
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplication navigator',
      initialRoute: "/",
      routes: {
        "/": (context) => Pantalla1(),
        "/pantalla2": (context) => Pantalla2(),
      },
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
            Navigator.pushNamed(
              context, "/pantalla2",
              arguments: "Mensaje desde la pantalla 1",
            );
          },
          child: Text("Ir a pantalla 2"),
        ),
      ),
    );
  }
}

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});
  @override
  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(title: Text("Pantalla 2"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(argumento, textScaler: TextScaler.linear(2),),
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