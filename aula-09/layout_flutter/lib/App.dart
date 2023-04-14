import 'package:layout_flutter/widgets/detalhes.dart';
import 'package:layout_flutter/widgets/inicio.dart';
import 'package:layout_flutter/widgets/login.dart';
import 'package:layout_flutter/widgets/cadastro.dart';
import 'package:layout_flutter/rotas.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        Rotas.inicio : (context) => Inicio(),
        Rotas.login : (context) => Login(),
        //Rotas.home : (context) => Home(),
        Rotas.cadastro : (context) => Cadastro(),
        //Rotas.lista : (context) => Lista(),
        //dRotas.detalhes : (context) => Detalhes()
      }
    ) ;
  }
}