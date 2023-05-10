import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/detalhes.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista')),
      body:  ElevatedButton(child: const Text('Detalhes'),
      onPressed: (){
        Navigator.pushNamed(context, 'Detalhes');
      },),  
    );
  }
}