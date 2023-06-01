import 'package:flutter/material.dart';

import '../database/sqlite/dao/ContatoDAOSQLite.dart';
import 'dto/contato.dart';
import 'interface/contato_interface_dao.dart';
import 'widget/botao.dart';
import 'widget/campo_email.dart';
import 'widget/campo_nome.dart';
import 'widget/campo_telefone.dart';
import 'widget/campo_url.dart';

class ContatoForm extends StatefulWidget{
  const ContatoForm({Key? key}) : super(key: key);

  @override
  State<ContatoForm> createState() => _ContatoFormState();
}

class _ContatoFormState extends State<ContatoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;

  @override
  Widget build(BuildContext context){
    receberContatoParaAlteracao(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Form(
        key: formKey,
        child: Column( 
          children: [
            campoNome,
            campoTelefone,
            campoEmail,
            campoURL,
            criarBotao(context),
          ],
        )
      )
    );
  }

  final campoNome = CampoNome(controle: TextEditingController());
  final campoTelefone = CampoTelefone(controle: TextEditingController());
  final campoEmail = CampoEmail(controle: TextEditingController());
  final campoURL = CampoURL(controle: TextEditingController());

  Widget criarBotao(BuildContext context){
    return Botao(
      context: context,
      salvar: (){
        var formState = formKey.currentState;
        if(formState != null && formState.validate()){
          var  contato = preencherDTO();
          ContatoInterfaceDAO dao = ContatoDAOSQLite(); 
          dao.salvar(contato);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberContatoParaAlteracao(BuildContext context){
    var parametro = ModalRoute.of(context);
    if(parametro != null && parametro.settings.arguments != null){
      Contato contato = parametro.settings.arguments as Contato;
      id = contato.id;
      preencherCampos(contato);
    }
  }

  Contato preencherDTO(){
    return Contato(
      id: id,
      nome: campoNome.controle.text,
      email: campoEmail.controle.text,
      telefone: campoTelefone.controle.text,
      urlAvatar: campoURL.controle.text
    );
  }

  void preencherCampos(Contato contato){
    campoNome.controle.text = contato.nome;
    campoEmail.controle.text = contato.email;
    campoTelefone.controle.text = contato.telefone;
    campoURL.controle.text = contato.urlAvatar;
  }
}
