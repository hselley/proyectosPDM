import 'package:flutter/material.dart';

void main() {
  runApp(App0701());
}

class App0701 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

const _youAre = "You are";
const _compatible = "compatible with\n Doris D. Developer.";

class _MyHomePageState extends State<MyHomePage> {
  bool _ageSwitchValue = false;
  String _messageToUser = "$_youAre NOT $_compatible";

  /// State
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Are you compatible with Doris?"),),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildAgeSwitch(),
            _buildResultArea(),
          ],
        ),
      )
    );
  }

  Widget _buildAgeSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Are you 18 or older?"),
        Switch(value: _ageSwitchValue, onChanged: _updateAgeSwitch)
      ],
    );
  }

  Widget _buildResultArea() {
    return Text(_messageToUser, textAlign: TextAlign.center,);
  }

  void _updateAgeSwitch(bool newValue) {
   setState(() {
     _ageSwitchValue = newValue;
     _messageToUser = _youAre + (_ageSwitchValue ? " " : " NOT " ) + _compatible;
   });
  }
}