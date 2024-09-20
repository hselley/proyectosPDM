// Cupertino App
import 'package:flutter/cupertino.dart';

void main() => runApp(App0305());

class App0305 extends StatelessWidget {
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Texto en la barra"),
          ),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hola mundo iOS"),
              Text("Steve Jobs es mi Dios"),
              SizedBox(height: 250.0),
              Text("Think different ... like everyone else"),
            ],
          )),
      ),
    );
  }
} 


