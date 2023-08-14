import 'package:layout_flutter/conexao/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Conexao {
  static late Database _database;
  static bool _fechado = true;

  static Future<Database> criar() async {
    if (_fechado) {
      String path = join(await getDatabasesPath(), 'banco.db');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(criaTabelas);
          insercoesTabelas.forEach(db.execute);
        },
      );
      _fechado = false;
    }
    return _database;
  }
}