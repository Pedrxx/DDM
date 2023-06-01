

import 'package:crud/view/dto/contato.dart';

import '../../../view/interface/contato_interface_dao.dart';

class ContatoDAOSQLite implements ContatoInterfaceDAO {
  @override
  Future<Contato> consultar(int id) {
    // TODO: implement consultar
    throw UnimplementedError();
  }

  @override
  Future<List<Contato>> consultarTodos() {
    // TODO: implement consultarTodos
    throw UnimplementedError();
  }

  @override
  Future<bool> excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  Future<Contato> salvar(Contato contato) {
    // TODO: implement salvar
    throw UnimplementedError();
  }
}
