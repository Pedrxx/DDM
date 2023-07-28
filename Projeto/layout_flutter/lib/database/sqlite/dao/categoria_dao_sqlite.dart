import 'package:layout_flutter/database/sqlite/conexao.dart';
import 'package:layout_flutter/view/dto/DtoCategoria.dart';
import 'package:layout_flutter/view/interface/CategoriaInterfaceDAO.dart';
import 'package:sqflite/sqflite.dart';

class CategoriaDAOSQLite implements CategoriaInterfaceDAO{

  DtoCategoria converterCategoria(Map<dynamic,dynamic> resultado) {
    return DtoCategoria(
      id:   resultado['id'], 
      nome: resultado['nome'],
      desc: resultado['desc'],
      prioridade: resultado['prioridade']

    );
  }

  @override
  Future<DtoCategoria> consultar(id) async {
    // TODO: implement consultarTodos
    throw UnimplementedError();
  }

  @override
  Future<List<DtoCategoria>> consultarTodos() async {
    Database db = await  Conexao.criar();
    List<DtoCategoria> lista = (await   db.query('categoria')).map<DtoCategoria>(converterCategoria).toList();
    return lista;
  }

  @override
  bool excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }
  
  @override
  Future<DtoCategoria> salvar(DtoCategoria categoria) async {
    Database db = await  Conexao.criar();
    String sql;
    if(categoria.id == null){
      sql = 'INSERT INTO categoria (nome,desc,prioridade) VALUES (?,?,?,?)';
      int id = await db.rawInsert(sql,[categoria.nome,categoria.desc,categoria.prioridade]);
      categoria = DtoCategoria(
      id: categoria.id,
      nome: categoria.nome,
      desc: categoria.desc,
      prioridade: categoria.prioridade
      );
    }else{
      sql = 'UPDATE contato SET nome = ?, desc =?, prioridade = ? WHERE id = ?';
      db.rawUpdate(sql,[categoria.nome,categoria.desc,categoria.prioridade]);
    }
    return categoria;
  }

}