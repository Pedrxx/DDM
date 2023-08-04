import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout_flutter/conexao/dao/userDAO.dart';
import 'package:layout_flutter/telas/Home.dart';
import 'package:layout_flutter/telas/Inicio.dart';
import 'package:layout_flutter/view/userInterfaceDAO.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../conexao/dto/user.dart';


class Cadastro extends StatelessWidget{
  var _formKey = GlobalKey<FormState>();
  

  final  _emailController = TextEditingController();
  final  _nomeController = TextEditingController();
  final  _senhaController = TextEditingController();
  final  _cargoController = TextEditingController();
  final  _setorController = TextEditingController();
  final  _dataNascController = TextEditingController();
  final  _cpfController = TextEditingController();

  final _cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  final _dataMask = MaskTextInputFormatter(mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF0057A6),title: const Text('Cadastro')),
      body: Form(
        key: _formKey,
        child: Column(
           children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome Completo'
              ), validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
            ),TextFormField(
              controller: _cargoController,
              decoration: InputDecoration(
                labelText: 'Cargo'
              ), validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
            ),TextFormField(
              controller: _setorController,
              decoration: InputDecoration(
                labelText: 'Setor'
              ), validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email'
              ), validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
            ),
            TextFormField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha'
              ), validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
            ),
            TextFormField(
              controller: _dataNascController,
              inputFormatters: [_dataMask],
              decoration: InputDecoration(
                labelText: 'Data Nascimento'
              ), validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
              keyboardType: TextInputType.datetime,
            ),
            TextFormField(
              controller: _cpfController,
              inputFormatters: [_cpfMask],
              decoration: InputDecoration(
                labelText: 'CPF'
              ), validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
              keyboardType: TextInputType.number,
            ),            
            SizedBox(height: 50,),
            ElevatedButton(child: const Text('Cadastrar'), 
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  UserInterfacaDAO dao = UserDAO();
                  User user = _inserirUser();
                  dao.salvar(user);
                  Route rota = MaterialPageRoute(builder: (context) => Inicio());
                  Navigator.pushReplacementNamed(context, '/');
                  ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cadastro realizado !'))
                  );
                }
              }
            )
          ]
        ),
      ),
    );
  }

  User _inserirUser() {
    return User(
      nome: _nomeController.text,
      cargo: _cargoController.text, 
      setor: _setorController.text, 
      email: _emailController.text, 
      senha: _senhaController.text
    );
  }
}
