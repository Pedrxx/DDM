import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout_flutter/widgets/Home.dart';
import 'package:layout_flutter/widgets/Inicio.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'Login.dart';


class Cadastro extends StatelessWidget{
  var _formKey = GlobalKey<FormState>();
  

  final  _emailController = TextEditingController();
  final  _nomeController = TextEditingController();
  final  _senhaController = TextEditingController();
  final  _dataNascController = TextEditingController();
  final  _cpfController = TextEditingController();

  final _cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  final _dataMask = MaskTextInputFormatter(mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
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
}


// ElevatedButton(child: const Text('Home'),
//       onPressed: () {
//         Route rota = MaterialPageRoute(builder: (context) => Home(),);
//       Navigator.pushReplacementNamed(context, 'Home');
//       },),