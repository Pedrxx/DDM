import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Login.dart';
import 'package:layout_flutter/widgets/Cadastro.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Center(
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
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(child: const Text('Login'),
              onPressed: () {
                Route rota1 = MaterialPageRoute(builder: (context) => Login(),);
              Navigator.pushNamed(context, 'Login');
                },),
              SizedBox(width: 100,),
              ElevatedButton(child: const Text('Cadastro'),
              onPressed: () {
                Route rota2 = MaterialPageRoute(builder: (context) => Cadastro(),);
              Navigator.pushNamed(context, 'Cadastro');
                })
              ]
            )
          ],
        ),
      )
    );
  }



}