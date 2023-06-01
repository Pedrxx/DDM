import 'package:crud/view/dto/contato.dart';
import 'package:crud/view/interface/contato_interface_dao.dart';
import 'package:crud/view/widget/painel_botoes.dart';
import 'package:flutter/material.dart';

import '../database/sqlite/dao/ContatoDAOSQLite.dart';
import '../rota.dart';
import 'widget/barra_navegacao.dart';
import 'widget/botao_adicionar.dart';
import 'widget/foto_contato.dart';


class ContatoLista extends StatefulWidget {
  const ContatoLista({Key? key}) : super(key: key);

  @override
  State<ContatoLista> createState() => _ContatoListaState();
}

class _ContatoListaState extends State<ContatoLista> {
  ContatoInterfaceDAO dao = ContatoDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Contatos')),
      body: criarLista(context),
      floatingActionButton: BotaoAdicionar(acao: ()=> Navigator.pushNamed(context, Rota.contatoForm).then((value)=>buscarContatos())),
      bottomNavigationBar: const BarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarContatos(),
      builder: (context,AsyncSnapshot<List<Contato>> lista){
        if(!lista.hasData) return const CircularProgressIndicator();
        if(lista.data == null) return const Text('Não há contatos...');
        List<Contato> listaContatos = lista.data!;
        return ListView.builder(
          itemCount: listaContatos.length,
          itemBuilder: (context, indice) {
            var contato = listaContatos[indice];
            return criarItemLista(context, contato);
          },
        );
      },
    );
  }

  Future<List<Contato>> buscarContatos(){
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarItemLista(BuildContext context, Contato contato){
    return ItemLista(
      contato: contato, 
      alterar: () {
        Navigator.pushNamed(context, Rota.contatoForm, arguments: contato).then((value) => buscarContatos()); 
      },
      detalhes: (){
        Navigator.pushNamed(context, Rota.contatoDetalhe, arguments: contato);
      }, 
      excluir: (){
        dao.excluir(contato.id);
        buscarContatos();
      } 
    );
  }
}

class ItemLista extends StatelessWidget {
  final Contato contato;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista({required this.contato,required this.alterar, required this.detalhes, required this.excluir, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(  
      leading: FotoContato(contato: contato),
      title: Text(contato.nome),
      subtitle: Text(contato.telefone),
      trailing: PainelBotoes(
        alterar: alterar, 
        excluir: excluir
      ),
      onTap: detalhes,
    );
  }
}
