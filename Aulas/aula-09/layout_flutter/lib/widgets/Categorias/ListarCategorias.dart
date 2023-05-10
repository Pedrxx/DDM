import 'package:flutter/material.dart';

import 'package:layout_flutter/widgets/Categorias/AlterarCategorias.dart';

class ListarCategorias extends StatelessWidget{
  const ListarCategorias({super.key});

  void showSuccessMessage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Registro Excluido!"),
        actions: <Widget>[
          ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, 'ListarCategorias'), child: Text("Ok"))
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
                  title: Text('Categoria $index'),
                  subtitle: Text('Descrição: Lorem ipsum dolor sit amet'),
                  trailing: GestureDetector(
                    child: Icon(Icons.delete,color: Colors.red),
                    onTap: () => showSuccessMessage(context),
                  ),
                  leading: GestureDetector(
                    child: Icon(Icons.edit),
                    onTap: (){
                       Route rota2 = MaterialPageRoute(builder: (context) => AlterarCategorias(),);
                        Navigator.pushNamed(context, 'Alterar');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}