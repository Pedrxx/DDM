import 'package:flutter/material.dart';

import 'Alterar.dart';

class Detalhes extends StatelessWidget{
  const Detalhes({super.key});

  void showSuccessMessage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Registro Excluido!"),
        actions: <Widget>[
          ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, 'Detalhes'), child: Text("Ok"))
        ],
      ),
    );
    Navigator.pop(context);
  }
  
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
                  // trailing: Row(
                  //   children: [
                  //     Icon(Icons.delete),
                  //     SizedBox(width: 10,),
                  //     Icon(Icons.favorite)
                  //   ],
                  // ),
                  trailing: GestureDetector(
                    child: Icon(Icons.delete,color: Colors.red),
                    onTap: () => showSuccessMessage(context),
                  ),
                  leading: GestureDetector(
                    child: Icon(Icons.edit),
                    onTap: (){
                       Route rota2 = MaterialPageRoute(builder: (context) => Alterar(),);
                        Navigator.pushNamed(context, 'Alterar');
                    },
                  ),
                  // onTap: () {
                  //    Route rota2 = MaterialPageRoute(builder: (context) => Alterar(),);
                  //   Navigator.pushNamed(context, 'Alterar');
                  // },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}