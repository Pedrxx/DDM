import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/home.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body:  ElevatedButton(child: const Text('Home'),
      onPressed: (){
        Navigator.pushReplacementNamed(context, 'Home');
      },),  
    );
  }
}