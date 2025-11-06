// sharedPrefsMain.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences Demo',
      home: SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  @override
  _SharedPreferencesDemoState createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  String _nombre = '';
  int _edad = 0;
  bool _notificaciones = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Cargar datos
  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nombre = prefs.getString('nombre') ?? '';
      _edad = prefs.getInt('edad') ?? 0;
      _notificaciones = prefs.getBool('notificaciones') ?? true;
    });
  }

  // Guardar datos
  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nombre', _nombre);
    await prefs.setInt('edad', _edad);
    await prefs.setBool('notificaciones', _notificaciones);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preferences')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nombre'),
              onChanged: (value) => setState(() => _nombre = value),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Edad'),
              keyboardType: TextInputType.number,
              onChanged: (value) => setState(() => _edad = int.tryParse(value) ?? 0),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Notificaciones'),
              value: _notificaciones,
              onChanged: (value) => setState(() => _notificaciones = value),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Datos guardados')),
                );
              },
              child: Text('Guardar'),
            ),
            SizedBox(height: 20),
            Text('Datos guardados:'),
            Text('Nombre: $_nombre'),
            Text('Edad: $_edad'),
            Text('Notificaciones: $_notificaciones'),
          ],
        ),
      ),
    );
  }
}
