import 'package:flutter/material.dart';
import 'package:layout_flutter/App.dart';
import 'package:layout_flutter/database/daofake/Categorias/CatDaoFake.dart';
import 'package:layout_flutter/view/dto/DtoCategoria.dart';
import 'package:layout_flutter/view/interface/CategoriaInterfaceDAO.dart';

import 'package:layout_flutter/widgets/details/botao_adicionar.dart';

import '../../Rotas.dart';
import '../details/barra_navegacao.dart';

class ListarCategorias extends StatefulWidget{
  const ListarCategorias({Key? key}) : super(key: key);
  
  @override
  State<ListarCategorias> createState() => _ListarCategorias();

}

class _ListarCategorias extends State<ListarCategorias> {
  CategoriaInterfaceDAO dao = CategoriaDAOFake();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listar Categorias")),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(
        acao: () => Navigator.pushNamed(context, Rotas.incluirCategorias)),
      bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarCategorias(),
      builder: (context, AsyncSnapshot<List<DtoCategoria>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há categorias...');
        List<DtoCategoria> listarCategorias = lista.data!;
        return ListView.builder(
          itemCount: listarCategorias.length,
          itemBuilder: (context, indice) {
            var categoria = listarCategorias[indice];
            return criarItemLista(context, categoria);
          },
        );
      },
    );
  }

  Future<List<DtoCategoria>> buscarCategorias() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, DtoCategoria categoria) {
    return ItemLista(
        categoria: categoria,
        alterar: () {
          Navigator.pushNamed(context, Rotas.menuCategorias, arguments: categoria)
              .then((value) => buscarCategorias());
        },
        detalhes: () {
          Navigator.pushNamed(context, Rotas.incluirCategorias);
        },
        excluir: () {
          dao.excluir(categoria.id);
          buscarCategorias();
        });
  }

}

class ItemLista extends StatelessWidget {
  final DtoCategoria categoria;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.categoria,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: FotoContato(categoria: categoria),
      title: Text(categoria.nome),
      subtitle: Text(categoria.desc),
      trailing: SizedBox( 
        width: 100,
        child: Row(
          children: [ 
            IconButton(onPressed: excluir, icon: const Icon(Icons.delete), color: Colors.red,),
            IconButton(onPressed: alterar, icon: const Icon(Icons.edit), color: Colors.orange,)
          ],
        ),
      ),
      onTap: detalhes,
    );
  }
}




