import 'package:flutter/material.dart';

void main() => runApp(App0704());

class App0704 extends StatelessWidget {
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
const _compatible = 'compatible with Irving.';

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _nameFieldController, _incomeFieldController;
  late String _messageToUser;

  /// State
  @override
  void initState() {
    super.initState();
    _nameFieldController = TextEditingController();
    _incomeFieldController = TextEditingController();
    _messageToUser = "";
  }

  @override
  void dispose() {
    _nameFieldController.dispose();
    _incomeFieldController.dispose();
    super.dispose();
  }

  /// Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Are you compatible with Irving?"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _buildNameTextField(),
            _buildIncomeTextField(),
            _buildResultArea(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNameTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: TextField(
        controller: _nameFieldController,
        decoration: _buildDecoration("Your name"),
      ),
    );
  }
  
  Widget _buildIncomeTextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: TextField(
        controller: _incomeFieldController,
        decoration: _buildDecoration("Your income"),
        keyboardType: TextInputType.number,
      ),
    );
  }
  
  InputDecoration _buildDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
    );
  }

  Widget _buildResultArea() {
    return Row(
      children: <Widget>[
        ElevatedButton(onPressed: _updateResults, child: Text("Submit")),
        const SizedBox(width: 15.0,),
        Text(_messageToUser, textAlign: TextAlign.center,),
      ],
    );
  }

  /// Actions
  void _updateResults() {
    bool _richUser = int.parse(_incomeFieldController.text) >= 1000;
    setState(() {
      _messageToUser = _nameFieldController.text + "\n" + _youAre + (_richUser ? " " : " NOT ") + _compatible;
    });
  }









}