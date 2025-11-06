# store_data

Un proyecto de Flutter que muestra las diferentes formas de 
almacenar datos.

| Método                | Uso ideal                     | Ventajas                             |
|-----------------------|-------------------------------|--------------------------------------|
| `shared_preferences`  | Datos simples (configuración) | Fácil, rápido, ligero                |
| `sqflite`             | Datos estructurados           | Completo, soporta consultas SQL      |
| `Hive`                | Datos simples y rápidos       | Rápido, fácil de usar                |
| `File System`         | Archivos grandes o binarios   | Control total sobre archivos         |


## Configuración de dependencias

Para cada ejemplo, es necesario agregar las dependencias correspondientes al archivo `pubspec.yaml`:

### Para Shared Preferences:
```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.2
```

### Para SQLite:
```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0
  path: ^1.8.3
```

### Para Hive:
```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
```

### Para File System:
```yaml
dependencies:
  flutter:
    sdk: flutter
  path_provider: ^2.1.1
```

