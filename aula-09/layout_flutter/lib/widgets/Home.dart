import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Config.dart';
import 'package:layout_flutter/widgets/Gastos.dart';
import 'package:layout_flutter/widgets/inicio.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Row(
        children: [
          ElevatedButton(child: const Text('Gastos'),
      onPressed: () {
        Route rota1 = MaterialPageRoute(builder: (context) => Gastos(),);
      Navigator.pushNamed(context, 'Gastos');
      },),
      ElevatedButton(child: const Text('Configuração'),
      onPressed: () {
        Route rota2 = MaterialPageRoute(builder: (context) => Config(),);
      Navigator.pushNamed(context, 'configuracao');
      }),
      ElevatedButton(child: const Text('Sair'),
      onPressed: () {
        Route rota3 = MaterialPageRoute(builder: (context) => Inicio(),);
      Navigator.pushReplacementNamed(context, 'Inicio');
      })
       ],
      )
    );
  }
}
