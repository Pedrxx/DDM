import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Alterar.dart';
import 'package:layout_flutter/widgets/Detalhes.dart';
import 'package:layout_flutter/widgets/Incluir.dart';
import 'package:layout_flutter/widgets/Categorias/IncluirCategorias.dart';
import 'ListarCategorias.dart';


class Categorias extends StatelessWidget{
  const Categorias({super.key});
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: const Text('Categorias')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              height: 75,
              width: 130,
              child: ElevatedButton(child: const Text('Incluir', style: TextStyle(fontSize: 20),),
              onPressed: () {
                Route rota1 = MaterialPageRoute(builder: (context) => IncluirCategorias(),);
              Navigator.pushNamed(context, 'IncluirCategorias');
              }),
            ),
              SizedBox(width: 75,),

            SizedBox(
              height: 75,
              width: 130,
              child: ElevatedButton(child: const Text('Categorias', style: TextStyle(fontSize: 20),),
              onPressed: () {
                Route rota2 = MaterialPageRoute(builder: (context) => ListarCategorias(),);
              Navigator.pushNamed(context, 'ListarCategorias');
                })
              )
            ],
          )
        ],
        ),
      ),
    );
  }
}