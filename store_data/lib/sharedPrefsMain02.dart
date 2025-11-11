// improved_shared_prefs.dart

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SharedPreferencesDemo(),
      //debugShowCheckedModeBanner: false,
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  @override
  _SharedPreferencesDemoState createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  // Variables de estado con valores por defecto más claros
  String _nombre = '';
  int _edad = 0;
  bool _notificaciones = true;
  bool _isLoading = true;
  String _mensaje = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Cargar datos con manejo de errores
  _loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      setState(() {
        _nombre = prefs.getString('nombre') ?? '';
        _edad = prefs.getInt('edad') ?? 0;
        _notificaciones = prefs.getBool('notificaciones') ?? true;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _mensaje = 'Error al cargar datos';
      });
      print('Error al cargar datos: $e');
    }
  }

  // Guardar datos con manejo de errores y confirmación
  _saveData() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('nombre', _nombre);
      await prefs.setInt('edad', _edad);
      await prefs.setBool('notificaciones', _notificaciones);

      // Mostrar snackbar de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Datos guardados correctamente'),
          backgroundColor: Colors.green,
        ),
      );

      // Actualizar mensaje de estado
      setState(() {
        _mensaje = 'Datos guardados';
      });

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar datos'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error al guardar datos: $e');
    }
  }

  // Limpiar todos los datos
  _clearData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      setState(() {
        _nombre = '';
        _edad = 0;
        _notificaciones = true;
        _mensaje = 'Datos eliminados';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Datos eliminados'),
          backgroundColor: Colors.orange,
        ),
      );
    } catch (e) {
      print('Error al limpiar datos: $e');
    }
  }

  // Validar edad
  _validateEdad(String value) {
    if (value.isEmpty) return 0;
    final int? edad = int.tryParse(value);
    return edad ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Shared Preferences')),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _clearData,
            tooltip: 'Limpiar datos',
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Mensaje de estado
            if (_mensaje.isNotEmpty)
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _mensaje.contains('guardados')
                      ? Colors.green.withValues(alpha: 0.1)
                      : _mensaje.contains('eliminados')
                      ? Colors.orange.withValues(alpha: 0.1)
                      : Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _mensaje,
                  style: TextStyle(
                    color: _mensaje.contains('guardados')
                        ? Colors.green
                        : _mensaje.contains('eliminados')
                        ? Colors.orange
                        : Colors.grey,
                  ),
                ),
              ),

            // Campo de nombre
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'Ingresa tu nombre',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) => setState(() => _nombre = value),
              maxLength: 50,
            ),
            SizedBox(height: 15),

            // Campo de edad
            TextField(
              decoration: InputDecoration(
                labelText: 'Edad',
                hintText: 'Ingresa tu edad',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => setState(() => _edad = _validateEdad(value)),
              maxLength: 3,
            ),
            SizedBox(height: 15),

            // Switch de notificaciones
            ListTile(
              title: Text('Notificaciones'),
              subtitle: Text('Recibir notificaciones de la aplicación'),
              trailing: Switch(
                value: _notificaciones,
                onChanged: (value) => setState(() => _notificaciones = value),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
            ),
            SizedBox(height: 20),

            // Botones
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveData,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('Guardar'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _clearData,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('Limpiar'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Mostrar datos guardados
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Datos guardados:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Nombre: $_nombre'),
                  Text('Edad: $_edad'),
                  Text('Notificaciones: ${_notificaciones ? "Activadas" : "Desactivadas"}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}