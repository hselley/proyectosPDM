import 'package:flutter/material.dart';

main() => runApp(App0309());

class App0309 extends StatelessWidget {
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
                Center(child: Text("Sebastiano Ricci", textScaler: TextScaler.linear(2),)),
                Image.asset("assets/SebastianoRicci.jpg", height: 300,),
                SizedBox(height: 40.0,),
                Center(child: Text("Van Gogh", textScaler: TextScaler.linear(2),)),
                Image.asset("assets/VanGogh.jpg", height: 300,),
                SizedBox(height: 40.0,),
                Center(child: Text("Leonardo DaVinci", textScaler: TextScaler.linear(2),)),
                Image.asset("assets/MonaLisa.png", height: 400,),
                SizedBox(height: 40.0,),
                Center(child: Text("Anonimous amateur", textScaler: TextScaler.linear(2),)),
                Image.asset("assets/amateur.png", height: 400, ),
              ],
            ),
        ),
        ),
    );
  }
}