import 'package:layout_flutter/conexao/dao/userDadosFake.dart';
import 'package:layout_flutter/conexao/dto/user.dart';
import 'package:layout_flutter/view/userInterfaceDAO.dart';

class UserDAO implements UserInterfacaDAO {
  @override
  User consultar(int id) {
    User user = users.firstWhere((user) => user.id == id, orElse: () => User(id: -1, nome: '', cargo: '', setor: '', senha: '', acesso: '', email: '')); // Caso não encontre, retorna um User com ID inválido

    return user;
  }

  @override
  List<User> consultarTodos() {
    // TODO: implement consultarTodos
    throw UnimplementedError();
  }

  @override
  Future<bool> excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  User salvar(User user) {
    
    if (user.id == null) {
      user = User(id: users.length + 1,nome: user.nome,cargo: user.cargo,setor: user.setor,email: user.email,acesso: 'User',senha: user.senha);
      users.add(user);
    } else {
      int t =(user.id as int) - 1;
      users[t] = user;
    }

    return user;
  }
  
  @override
  User consultarPorNome(String nome) {
    User user = users.firstWhere((user) => user.nome == nome, orElse: () => User(id: -1, nome: '', cargo: '', setor: '', senha: '', acesso: '', email: '')); // Caso não encontre, retorna um User com ID inválido

    return user;
  }

  bool validarSenha(String nome, String senha) {
    // User user = users.firstWhere((user) => user.nome == nome, orElse: () => User(id: -1, nome: '', cargo: '', setor: '', senha: '', acesso: '', email: '')); // Busca o usuário pelo nome
    User user = consultarPorNome(nome);

    if (user.id == -1) {
      // Caso o usuário não seja encontrado, a senha é inválida
      return false;
    } else {
      // Verifica se a senha fornecida corresponde à senha do usuário
      return user.senha == senha;
    }
  }
}