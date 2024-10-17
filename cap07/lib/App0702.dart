// App0702.dart

import 'package:flutter/material.dart';

void main() => runApp(App0702());

class App0702 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const _youAre = 'You are';
const _compatible = 'compatible with\nDoris D. Developer';

class _MyHomePageState extends State<MyHomePage> {
  bool _ageSwitchValue = false;
  String _messageToUser = "";

  /// State
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Are you compatible with Doris?"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _buildAgeSwitch(),
            _buildResultArea(),
          ],
        ),
      ),
    );
  }

  /// Build
  Widget _buildAgeSwitch() {
    return Row(
      children: <Widget>[
        const Text("Are you 18 or older?"),
        Switch(value: _ageSwitchValue, onChanged: _updateAgeSwitch)
      ],
    );
  }

  Widget _buildResultArea() {
    return Row(
      children: <Widget>[
        ElevatedButton(onPressed: _updateResults, child: const Text("Submit")),
        const SizedBox(width: 15.0,),
        Text(_messageToUser, textAlign: TextAlign.center,),
      ],
    );
  }

  /// Actions
  void _updateAgeSwitch(bool newValue) {
    setState(() {
      _ageSwitchValue = newValue;
    });
  }

  void _updateResults() {
    setState(() {
      _messageToUser = _youAre + (_ageSwitchValue ? " " : " NOT ") + _compatible;
    });
  }


}