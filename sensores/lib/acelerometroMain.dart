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
      title: 'Acelerómetro Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AccelerometerScreen(),
    );
  }
}

class AccelerometerScreen extends StatefulWidget {
  @override
  _AccelerometerScreenState createState() => _AccelerometerScreenState();
}

class _AccelerometerScreenState extends State<AccelerometerScreen> {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;
  bool _isListening = false;
  List<String> _motionHistory = [];

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    if (!_isListening) {
      accelerometerEvents.listen(_onAccelerometerEvent);
      setState(() {
        _isListening = true;
      });
    }
  }

  void _stopListening() {
    if (_isListening) {
      // En una aplicación real, deberías cancelar el stream
      // Pero por simplicidad, simplemente desactivamos la escucha
      setState(() {
        _isListening = false;
      });
    }
  }

  void _onAccelerometerEvent(AccelerometerEvent event) {
    setState(() {
      _x = event.x;
      _y = event.y;
      _z = event.z;

      // Agregar a historial de movimientos
      _motionHistory.add(
          'X: ${event.x.toStringAsFixed(2)}, Y: ${event.y.toStringAsFixed(2)}, Z: ${event.z.toStringAsFixed(2)}'
      );

      // Mantener solo los últimos 20 registros
      if (_motionHistory.length > 20) {
        _motionHistory.removeAt(0);
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
        title: Text('Acelerómetro'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información principal del acelerómetro
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Valores del Acelerómetro',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSensorCard('X', _x),
                          _buildSensorCard('Y', _y),
                          _buildSensorCard('Z', _z),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Indicador de movimiento
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Movimiento Detectado',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            _calculateMovementStatus(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Historial de movimientos
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Historial de Movimientos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 150,
                        child: ListView.builder(
                          itemCount: _motionHistory.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                _motionHistory[_motionHistory.length - 1 - index],
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
                        _motionHistory.clear();
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

  Widget _buildSensorCard(String label, double value) {
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
          'm/s²',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  String _calculateMovementStatus() {
    double magnitude = sqrt(_x * _x + _y * _y + _z * _z);

    if (magnitude > 15) {
      return '¡Movimiento Fuerte!';
    } else if (magnitude > 5) {
      return 'Movimiento Moderado';
    } else if (magnitude > 1) {
      return 'Movimiento Suave';
    } else {
      return 'Sin Movimiento';
    }
  }
}