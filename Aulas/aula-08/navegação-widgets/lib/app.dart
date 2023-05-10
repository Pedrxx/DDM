import 'package:flutter_application_1/widget/detalhes.dart';
import 'package:flutter_application_1/widget/login.dart';
import 'package:flutter_application_1/widget/cadastro.dart';
import 'package:flutter_application_1/widget/lista.dart';
import 'package:flutter_application_1/widget/home.dart';
import 'package:flutter_application_1/rotas.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  const App({super.key});

  // var pessoa = {
  //   'nome' : 'Pedro',
  //   'idade' : 21,
  //   'função' : (){

  //   }
  // };

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        Rotas.login : (context) => Login(),
        Rotas.home : (context) => Home(),
        Rotas.cadastro : (context) => Cadastro(),
        Rotas.lista : (context) => Lista(),
        Rotas.detalhes : (context) => Detalhes()
      }
    ) ;
  }
}