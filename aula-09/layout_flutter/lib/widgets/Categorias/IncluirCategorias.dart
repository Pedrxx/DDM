import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Gastos.dart';
import 'package:layout_flutter/widgets/Home.dart';

import 'Categorias.dart';

const List<String> list = <String>['Posto de Gasolina', 'Mercado', 'PetShop', 'Barbeiro'];


class IncluirCategorias extends StatelessWidget{
  //const Cadastro({super.key});
  final _formKey = GlobalKey<FormState>();


  final  _descController = TextEditingController();
  final  _importController = TextEditingController();

  void showSuccessMessage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Cadastro de Categoria efetuado com sucesso!"),
        actions: <Widget>[
          ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, 'Home'), child: Text("Ok"))
        ],
      ),
    );
    Navigator.pop(context);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(title: const Text('Cadastro de Categoria')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _descController,
              decoration: InputDecoration(
                labelText: 'Digite a categoria'
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório!';
                }
              },
            ),
            TextFormField(
              controller: _importController,
              decoration: InputDecoration(
                labelText: 'Digite a descrição'
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite um valor';
                }
              },
            ),
            SizedBox(height: 30,),
            ElevatedButton(child: const Text('Incluir'),
              onPressed: () {
                Route rota3 = MaterialPageRoute(builder: (context) => Categorias(),);
                  Navigator.pushNamed(context, 'Gastos');
                showSuccessMessage(context);
            },),
          ],
        ),
      )
    );
  }
}
