// App09Main.dart

import 'package:flutter/material.dart';
import 'App0904.dart';

void main() => runApp(App09Main());

class App09Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late Animation<double> animation; // [1.0, 200.0]
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this
    );
    animation = getAnimation(controller) as Animation<double>;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    buildPositionedWidget(),
                  ],
                ),
              ),
              buildRowOfButtons(),
            ],
          ),
        )
      ),
    );
  }

  Widget buildRowOfButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(onPressed: () => controller.forward(), child: Text("Forward")),
        SizedBox(width: 8.0,),
        ElevatedButton(onPressed: () => controller.animateBack(0.0), child: Text("Backward")),
        SizedBox(width: 8.0,),
        ElevatedButton(onPressed: () => controller.reset(), child: Text("Reset")),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}