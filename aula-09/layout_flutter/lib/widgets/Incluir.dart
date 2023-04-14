import 'package:flutter/material.dart';

class Incluir extends StatelessWidget {
  const Incluir({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Incluir')),
      body:  ElevatedButton(child: const Text('Lista'),
      onPressed: (){
        // Route rota = MaterialPageRoute(builder: (context) => Lista(),);
      //Navigator.pushNamed(context, 'Lista');
      },),  
    );
  }
}