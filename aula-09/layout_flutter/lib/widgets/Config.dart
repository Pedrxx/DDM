import 'dart:io';

import 'package:flutter/material.dart';

class Config extends StatelessWidget{
  const Config({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuração de Usuário'),),
      body: Column(
        children: [
          // Image(
          //   image: FileImage('C:/Faculdade 2023/DDM/DDM/aula-09/layout_flutter/lib/images'),
          //   width: 100,
          //   height: 100,
          //   )
          Container(
            child: Image.asset('assets/images/avatar.png'),
          )
        ],
      ),
    );
  }
  

}