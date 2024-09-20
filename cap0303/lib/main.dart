import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() => runApp(App0303());

class App0303 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mi segundo Scaffold"),
          elevation: 100,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Center(child: Text("Hola mundo cruel")),
        drawer: Drawer(
          child: Center(child: Text("Estoy en la cajonera")),
        ),
      ),
    );
  }
}