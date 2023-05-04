import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Alterar.dart';
import 'package:layout_flutter/widgets/Detalhes.dart';
import 'package:layout_flutter/widgets/Incluir.dart';

class Gastos extends StatelessWidget{
  const Gastos({super.key});
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: const Text('Gastos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              height: 75,
              width: 125,
              child: ElevatedButton(child: const Text('Incluir', style: TextStyle(fontSize: 20),),
              onPressed: () {
                Route rota3 = MaterialPageRoute(builder: (context) => Incluir(),);
              Navigator.pushNamed(context, 'Incluir');
              }),
            ),
              SizedBox(width: 75,),

            SizedBox(
              height: 75,
              width: 125,
              child: ElevatedButton(child: const Text('Listar', style: TextStyle(fontSize: 20),),
              onPressed: () {
                Route rota4 = MaterialPageRoute(builder: (context) => Detalhes(),);
              Navigator.pushNamed(context, 'Detalhes');
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