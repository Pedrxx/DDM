import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Home.dart';
import 'package:layout_flutter/widgets/Inicio.dart';

import 'Login.dart';


class Cadastro extends StatelessWidget{
  //const Cadastro({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailConfController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _dataNascController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  
  void showSuccessMessage(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text("Cadastro Efetuado com sucesso!"),
      actions: <Widget>[
        ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, '/'), child: Text("Ok"))
      ],
    ),
  );
  Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
           children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome Completo'
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextFormField(
              controller: _dataNascController,
              decoration: InputDecoration(
                labelText: 'Data Nascimento'
              ),
              keyboardType: TextInputType.datetime,
            ),
            TextFormField(
              controller: _cpfController,
              decoration: InputDecoration(
                labelText: 'CPF'
              ),
              keyboardType: TextInputType.number,
            ),            
            SizedBox(height: 50,),
            ElevatedButton(child: const Text('Cadastrar'), 
              onPressed: () {
                Route rota = MaterialPageRoute(builder: (context) => Inicio());
              Navigator.pushNamed(context, '/');
              showSuccessMessage(context);
              })
          ]),
      ),
    );
  }
}


// ElevatedButton(child: const Text('Home'),
//       onPressed: () {
//         Route rota = MaterialPageRoute(builder: (context) => Home(),);
//       Navigator.pushReplacementNamed(context, 'Home');
//       },),