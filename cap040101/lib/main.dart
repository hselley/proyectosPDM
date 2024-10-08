import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final List<int> entries = <int>[2,3,4,5,6,7,8,9,10,11];
final List<int> colorCodes = <int>[900,800,700,600,500,400,300,200,100,50];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
                child: Text("Factorial",
                  style: TextStyle(fontSize: 35, color: Colors.cyan),
                )),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(50),
            itemCount: entries.length,
            reverse: false,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 250,
                color: Colors.blue[colorCodes[index]],
                child: Center(
                    child: Text(
                      "${entries[index]}! = ${factorialRecursivo(entries[index])}",
                      style: const TextStyle(
                        fontSize: 30,
                        inherit: false,
                        color: Colors.black
                      ),
        
                    )
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) => const Divider(height: 50,),
        ),
      )
    );
  }
}

double factorialRecursivo(int n) {
  if(n==0 || n==1)
    return(1);
  else
    return n*factorialRecursivo(n-1);
}
