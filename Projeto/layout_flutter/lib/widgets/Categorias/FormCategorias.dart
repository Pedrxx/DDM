
import 'package:flutter/material.dart';
import 'package:layout_flutter/database/daofake/Categorias/CatDaoFake.dart';
import 'package:layout_flutter/view/dto/DtoCategoria.dart';
import 'package:layout_flutter/view/interface/CategoriaInterfaceDAO.dart';
import 'package:layout_flutter/widgets/Categorias/DescController.dart';
import 'package:layout_flutter/widgets/Categorias/NomeController.dart';
import 'package:layout_flutter/widgets/Categorias/PrioridadeController.dart';

import '../details/botao.dart';

class FormCategorias extends StatefulWidget{
  FormCategorias({Key? key}) : super(key: key);

  @override
  State<FormCategorias> createState() => _FormCategoriasState();

}

class _FormCategoriasState extends State<FormCategorias> {
  final _formKey = GlobalKey<FormState>();

  dynamic id;

  
  @override
  Widget build(BuildContext context) {
    receberCategoriaParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Form(
        key: _formKey,
        child: Column( 
          children: [
            nomeControle,
            descControle,
            prioControle,
            criarBotao(context),
          ],
        )
      )
    );
  }

  final descControle = DescController(controle: TextEditingController());
  final nomeControle = NomeController(controle: TextEditingController());
  final prioControle = PrioridadeController(controle: TextEditingController());
  
void receberCategoriaParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if(parametro != null && parametro.settings.arguments != null){
      DtoCategoria categoria = parametro.settings.arguments as DtoCategoria;
      id = categoria.id;
      preencherCampos(categoria);
    }
  }

    Widget criarBotao(BuildContext context){
    return Botao(
      context: context,
      salvar: (){
        var formState = _formKey.currentState;
        if(formState != null && formState.validate()){
          var  contato = preencherDTO();
          CategoriaInterfaceDAO dao = CategoriaDAOFake(); 
          dao.salvar(contato);
          Navigator.pop(context);
        }
      },
    );
  }

  DtoCategoria preencherDTO(){
    return DtoCategoria(
      id: id,
      nome: nomeControle.controle.text,
      desc: descControle.controle.text,
      prioridade: prioControle.controle.text
    );
  }

  void preencherCampos(DtoCategoria categoria){
    nomeControle.controle.text = categoria.nome;
    descControle.controle.text = categoria.desc;
    prioControle.controle.text = categoria.prioridade;
  }
}