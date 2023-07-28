import 'package:layout_flutter/database/sqlite/scriptbd.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart'; //importanção


class Conexao {

  static late Database _conexao;
  static bool _fechado = true;

  static Future<Database> criar() async{
    if(_fechado) {
      String path = join(await getDatabasesPath(), 'banco_db');
      _conexao = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(criarContato);
          insercoesContato.forEach(db.execute);
        }
      );
      _fechado = false;
    }
    return _conexao;
  }

}