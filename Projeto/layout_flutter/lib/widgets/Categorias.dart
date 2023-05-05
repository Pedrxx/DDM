import 'package:flutter/material.dart';
import 'package:layout_flutter/App.dart';
import 'Alterar.dart';

class Categorias extends StatelessWidget{
  const Categorias({super.key});

    void showSuccessMessage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Registro Excluido!"),
        actions: <Widget>[
          ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, 'Categorias'), child: Text("Ok"))
        ],
      ),
    );
    Navigator.pop(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorias')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                index += 1;
                return ListTile(
                  title: Text('Gasto $index'),
                  subtitle: Text('Descrição Cat.$index '),
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