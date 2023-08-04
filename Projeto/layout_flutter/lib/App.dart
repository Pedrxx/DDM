
import 'package:layout_flutter/telas/Cadastro.dart';
import 'package:layout_flutter/telas/Home.dart';
import 'package:layout_flutter/telas/Inicio.dart';
import 'package:layout_flutter/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'conexao/credenciais.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserCredentials(), 
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          Rotas.inicio : (context) => Inicio(),
          Rotas.home : (context) => Home(),
          Rotas.cadastro : (context) => Cadastro(),
        }
      ) 
    );
  }
}