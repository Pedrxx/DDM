import 'package:layout_flutter/widgets/Alterar.dart';
import 'package:layout_flutter/widgets/Categorias/Categorias.dart';
import 'package:layout_flutter/widgets/Categorias/IncluirCategorias.dart';
import 'package:layout_flutter/widgets/Config.dart';
import 'package:layout_flutter/widgets/Detalhes.dart';
import 'package:layout_flutter/widgets/Gastos.dart';
import 'package:layout_flutter/widgets/Home.dart';
import 'package:layout_flutter/widgets/Incluir.dart';
import 'package:layout_flutter/widgets/inicio.dart';
import 'package:layout_flutter/widgets/login.dart';
import 'package:layout_flutter/widgets/cadastro.dart';
import 'package:layout_flutter/rotas.dart';
import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Categorias/ListarCategorias.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        Rotas.inicio : (context) => Inicio(),
        Rotas.login : (context) => Login(),
        Rotas.home : (context) => Home(),
        Rotas.cadastro : (context) => Cadastro(),
        Rotas.config : (context) => Config(),
        Rotas.gastos : (context) => Gastos(),
        Rotas.incluir : (context) => Incluir(),
        Rotas.detalhes : (context) => Detalhes(),
        Rotas.alterar : (context) => Alterar(),
        Rotas.categorias : (context) => Categorias(),
        Rotas.incluirCategorias : (context) => incluirCategorias(),
        Rotas.listarCategorias : (context) => ListarCategorias()

      }
    ) ;
  }
}