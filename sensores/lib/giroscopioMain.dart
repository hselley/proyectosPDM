import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giroscopio Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GyroscopeScreen(),
    );
  }
}

class GyroscopeScreen extends StatefulWidget {
  @override
  _GyroscopeScreenState createState() => _GyroscopeScreenState();
}

class _GyroscopeScreenState extends State<GyroscopeScreen> {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;
  bool _isListening = false;
  List<String> _rotationHistory = [];
  double _totalRotation = 0.0;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    if (!_isListening) {
      gyroscopeEvents.listen(_onGyroscopeEvent);
      setState(() {
        _isListening = true;
      });
    }
  }

  void _stopListening() {
    if (_isListening) {
      setState(() {
        _isListening = false;
      });
    }
  }

  void _onGyroscopeEvent(GyroscopeEvent event) {
    setState(() {
      _x = event.x;
      _y = event.y;
      _z = event.z;

      // Calcular rotación total (magnitud del vector)
      _totalRotation = sqrt(_x * _x + _y * _y + _z * _z);

      // Agregar a historial de rotaciones
      _rotationHistory.add(
          'X: ${event.x.toStringAsFixed(2)}, Y: ${event.y.toStringAsFixed(2)}, Z: ${event.z.toStringAsFixed(2)}'
      );

      // Mantener solo los últimos 20 registros
      if (_rotationHistory.length > 20) {
        _rotationHistory.removeAt(0);
      }
    });
  }

  @override
  void dispose() {
    _stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giroscopio'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información principal del giroscopio
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Valores del Giroscopio',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildRotationCard('X', _x),
                          _buildRotationCard('Y', _y),
                          _buildRotationCard('Z', _z),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Rotación Total',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800],
                              ),
                            ),
                            Text(
                              '${_totalRotation.toStringAsFixed(2)} rad/s',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Visualización de rotación
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Visualización de Rotación',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Center(
                          child: _buildRotationVisualization(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Rotación en grados: ${(_totalRotation * 57.2958).toStringAsFixed(1)}°',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Indicador de tipo de rotación
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tipo de Rotación',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            _getRotationType(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _getRotationColor(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Historial de rotaciones
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Historial de Rotaciones',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          itemCount: _rotationHistory.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                _rotationHistory[_rotationHistory.length - 1 - index],
                                style: TextStyle(fontSize: 12),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Botones de control
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isListening ? _stopListening : _startListening,
                    child: Text(_isListening ? 'Detener' : 'Iniciar'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _rotationHistory.clear();
                      });
                    },
                    child: Text('Limpiar Historial'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRotationCard(String label, double value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'rad/s',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildRotationVisualization() {
    double rotationX = _x * 100;
    double rotationY = _y * 100;
    double rotationZ = _z * 100;

    return Container(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Círculo base
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
          ),
          // Indicador de rotación
          Transform.rotate(
            angle: rotationZ,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[400],
              ),
              child: Center(
                child: Icon(
                  Icons.rotate_right,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          // Ejes
          Positioned(
            left: 50,
            top: 0,
            child: Container(
              width: 2,
              height: 100,
              color: Colors.red,
            ),
          ),
          Positioned(
            left: 0,
            top: 50,
            child: Container(
              width: 100,
              height: 2,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  String _getRotationType() {
    if (_totalRotation > 2.0) {
      return 'Rotación Rápida';
    } else if (_totalRotation > 0.5) {
      return 'Rotación Moderada';
    } else if (_totalRotation > 0.1) {
      return 'Rotación Lenta';
    } else {
      return 'Sin Rotación';
    }
  }

  Color _getRotationColor() {
    if (_totalRotation > 2.0) {
      return Colors.red;
    } else if (_totalRotation > 0.5) {
      return Colors.orange;
    } else if (_totalRotation > 0.1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}