import 'package:layout_flutter/conexao/dao/userDadosFake.dart';
import 'package:layout_flutter/conexao/dto/user.dart';
import 'package:layout_flutter/view/userInterfaceDAO.dart';
import 'package:sqflite/sqflite.dart';

import '../conexao.dart';

class UserDAO implements UserInterfacaDAO {
  @override
  Future<User> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('User', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterUser(resultado);
  }

  @override
  Future<List<User>> consultarTodos() async {
     Database db = await Conexao.criar();
    List<User> lista =
        (await db.query('usuario')).map<User>(converterUser).toList();
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM usuario WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<User> salvar(User user) async {
    
    Database db = await Conexao.criar();
    String sql;

    if (user.id == null) {
      sql =
          'INSERT INTO usuario (nome, email, cargo, setor, senha, acesso) VALUES (?, ?, ?, ?, ?, ?)';
      int id = await db.rawInsert(sql, [
        user.nome,
        user.email,
        user.cargo,
        user.setor,
        user.senha,
        user.acesso
      ]);
      user = User(
          id: id,
          nome:user.nome,
          email:user.email,
          cargo:user.cargo,
          setor:user.setor,
          senha:user.senha,
          acesso:user.acesso);
    } else {
      sql =
          'UPDATE usuario SET nome = ?, email = ?, cargo = ?, setor = ?, senha = ?, acesso = ? WHERE id = ?';
      db.rawUpdate(sql, [
        user.nome,
        user.email,
        user.cargo,
        user.setor,
        user.senha,
        user.acesso,
        user.id
      ]);
    }
    return user;
  }
  
  @override
  Future<User> consultarPorNome(String nome) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('User', where: 'nome = ?', whereArgs: [nome]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado registro com este nome');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterUser(resultado);
  }

  bool validarSenha(String nome, String senha) {
    User user = consultarPorNome(nome) as User;

    if (user.id == -1) {
      // Caso o usuário não seja encontrado, a senha é inválida
      return false;
    } else {
      // Verifica se a senha fornecida corresponde à senha do usuário
      return user.senha == senha;
    }
  }

  User converterUser(Map<dynamic, dynamic> resultado) {
    return User (
      id: resultado['id'],
      nome: resultado['nome'],
      email: resultado['email'],
      cargo: resultado['cargo'],
      senha: resultado['senha'],
      setor: resultado['setor'],
      acesso: resultado['acesso']
    );
    
  } 
}