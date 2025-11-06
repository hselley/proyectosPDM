import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('usuarios');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo',
      home: HiveDemo(),
    );
  }
}

class HiveDemo extends StatefulWidget {
  @override
  _HiveDemoState createState() => _HiveDemoState();
}

class _HiveDemoState extends State<HiveDemo> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _addUsuario() {
    if (_nombreController.text.isNotEmpty && _emailController.text.isNotEmpty) {
      final box = Hive.box('usuarios');
      box.add({
        'nombre': _nombreController.text,
        'email': _emailController.text,
        'fecha': DateTime.now(),
      });
      _nombreController.clear();
      _emailController.clear();
      setState(() {}); // Refrescar la lista
    }
  }

  _deleteUsuario(int index) {
    final box = Hive.box('usuarios');
    box.deleteAt(index);
    setState(() {}); // Refrescar la lista
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('usuarios');
    List<dynamic> usuarios = box.values.toList();

    return Scaffold(
      appBar: AppBar(title: Text('Hive Demo')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nombreController,
                    decoration: InputDecoration(labelText: 'Nombre'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addUsuario,
                  child: Text('Agregar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                var usuario = usuarios[index];
                return ListTile(
                  title: Text(usuario['nombre']),
                  subtitle: Text('${usuario['email']} - ${usuario['fecha']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteUsuario(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
