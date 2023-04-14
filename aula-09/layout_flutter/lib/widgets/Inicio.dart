import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Login.dart';
import 'package:layout_flutter/widgets/Cadastro.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Row(
        children: [
          ElevatedButton(child: const Text('Login'),
      onPressed: () {
        Route rota1 = MaterialPageRoute(builder: (context) => Login(),);
      Navigator.pushNamed(context, 'Login');
      },),
      ElevatedButton(child: const Text('Cadastro'),
      onPressed: () {
        Route rota2 = MaterialPageRoute(builder: (context) => Cadastro(),);
      Navigator.pushNamed(context, 'Cadastro');
      })
       ],
      )
      
    );
  }



}