
import '../conexao/dto/user.dart';

abstract class UserInterfacaDAO {
  Future<User> salvar(User user);
  Future<User> consultar(int id);
  Future<bool> excluir(dynamic id);
  Future<List<User>>  consultarTodos();
  Future<User> consultarPorNome(String nome);
}