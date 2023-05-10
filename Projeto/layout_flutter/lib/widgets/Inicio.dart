import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Login.dart';
import 'package:layout_flutter/widgets/Cadastro.dart';

import 'Home.dart';

class Inicio extends StatelessWidget {
  // const Inicio({super.key});
  final _formKey = GlobalKey<FormState>();


  final  _emailController = TextEditingController();
  final  _senhaController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            'Bem Vindo!',
            style: TextStyle(
              fontSize: 50,
              fontFamily: 'Futura',
              color: Colors.blue
            ),),
          SizedBox(height: 20,),
          Text(
            'Ao sistema de gastos pessoais.',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Futura',
              color: Colors.blue
            ),),
            SizedBox(height: 25,),
            Container(
              width: 300,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
              ),
            ),
            Container(
              width: 300,
              child: TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(
                  labelText: 'Senha'
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
              ),
            ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(child: const Text('Login'),
              onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    Route rota1 = MaterialPageRoute(builder: (context) => Home(),);
                    Navigator.pushReplacementNamed(context, 'Home');
                  }
                },
              ),
              SizedBox(width: 100,),
              ElevatedButton(child: const Text('Cadastro'),
              onPressed: () {
                Route rota2 = MaterialPageRoute(builder: (context) => Cadastro(),);
              Navigator.pushReplacementNamed(context, 'Cadastro');
                })
              ]
            )
          ],
        ),
      )
    );
  }



}