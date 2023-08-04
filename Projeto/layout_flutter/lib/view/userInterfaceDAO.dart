
import '../conexao/dto/user.dart';

abstract class UserInterfacaDAO {
  User salvar(User user);
  User consultar(int id);
  Future<bool> excluir(dynamic id);
  List<User>  consultarTodos();
  User consultarPorNome(String nome);
}