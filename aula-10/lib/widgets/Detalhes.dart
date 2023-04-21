import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget{
  const Detalhes({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Gastos')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                index += 1;
                return ListTile(
                  title: Text('Gasto $index'),
                  subtitle: Text('Valor: \$\$\$  |  Data: DD/MM/YYYY'),
                  //leading: Icon(Icons.merge_outlined),
                  ///trailing: Icon(Icons.favorite_border),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}