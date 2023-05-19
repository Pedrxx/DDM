
import 'package:layout_flutter/database/daofake/Categorias/CatDadosFake.dart';
import 'package:layout_flutter/widgets/Categorias/ListarCategorias.dart';

import '../../../view/dto/DtoCategoria.dart';
import '../../../view/interface/CategoriaInterfaceDAO.dart';

class CategoriaDAOFake implements CategoriaInterfaceDAO{
  @override
  Future<DtoCategoria> consultar(dynamic id) {
    return Future.value(categorias[id-1]);
  }

  @override
  Future<List<DtoCategoria>> consultarTodos() {
    // TODO: implement consultarTodos
    throw UnimplementedError();
  }

  @override
  bool excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  ListarCategorias salvar(DtoCategoria categorias) {
    // TODO: implement salvar
    throw UnimplementedError();
  }

  

}