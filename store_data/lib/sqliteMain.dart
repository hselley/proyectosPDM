import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      home: SQLiteDemo(),
    );
  }
}

class SQLiteDemo extends StatefulWidget {
  @override
  _SQLiteDemoState createState() => _SQLiteDemoState();
}

class _SQLiteDemoState extends State<SQLiteDemo> {
  late Database _db;
  List<Map<String, dynamic>> _usuarios = [];
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initDB();
  }

  _initDB() async {
    String path = join(await getDatabasesPath(), 'usuarios.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, email TEXT)',
        );
      },
    );
    _loadUsuarios();
  }

  _loadUsuarios() async {
    List<Map<String, dynamic>> usuarios = await _db.query('usuarios');
    setState(() {
      _usuarios = usuarios;
    });
  }

  _addUsuario() async {
    if (_nombreController.text.isNotEmpty && _emailController.text.isNotEmpty) {
      await _db.insert('usuarios', {
        'nombre': _nombreController.text,
        'email': _emailController.text,
      });
      _loadUsuarios();
      _nombreController.clear();
      _emailController.clear();
    }
  }

  _deleteUsuario(int id) async {
    await _db.delete('usuarios', where: 'id = ?', whereArgs: [id]);
    _loadUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Demo')),
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
              itemCount: _usuarios.length,
              itemBuilder: (context, index) {
                var usuario = _usuarios[index];
                return ListTile(
                  title: Text(usuario['nombre']),
                  subtitle: Text(usuario['email']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteUsuario(usuario['id']),
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
