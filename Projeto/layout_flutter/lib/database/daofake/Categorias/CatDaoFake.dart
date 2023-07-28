
import 'package:layout_flutter/database/daofake/Categorias/CatDadosFake.dart';
import 'package:layout_flutter/widgets/Categorias/ListarCategorias.dart';

import '../../../view/dto/DtoCategoria.dart';
import '../../../view/interface/CategoriaInterfaceDAO.dart';

class CategoriaDAOFake implements CategoriaInterfaceDAO{
  @override
  Future<DtoCategoria> consultar(dynamic id) {
    return Future.value(categoriaDados[id-1]);
  }

  @override
  Future<List<DtoCategoria>> consultarTodos() {
    return Future.value((categoriaDados));
  }

  @override
  bool excluir(id) {
    print('excluir ${categoriaDados[id-1]}');
    categoriaDados.remove(categoriaDados[id-1]);
    return true;
  }

  @override
  DtoCategoria salvar(DtoCategoria dtoCategoria) {
    if(dtoCategoria.id == null){
      dtoCategoria = DtoCategoria( 
        id: categoriaDados.length,
        nome: dtoCategoria.nome,
        desc: dtoCategoria.desc,
        prioridade: dtoCategoria.prioridade
      );
      categoriaDados.add(dtoCategoria);
      print("teste ${categoriaDados.length}");
    }else {
      int i = (dtoCategoria.id as int) - 1;
      categoriaDados[i] = dtoCategoria;
    }
    print(dtoCategoria);
    return dtoCategoria;

  }
}