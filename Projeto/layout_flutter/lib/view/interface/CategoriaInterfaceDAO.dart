import 'package:layout_flutter/view/dto/DtoCategoria.dart';
import '../../widgets/Categorias/ListarCategorias.dart';

abstract class CategoriaInterfaceDAO{
  ListarCategorias salvar(DtoCategoria categorias);
  bool excluir(dynamic id);
  Future<DtoCategoria> consultar(dynamic id);
  Future<List<DtoCategoria>>  consultarTodos();
}