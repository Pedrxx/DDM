import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Gastos.dart';
import 'package:layout_flutter/widgets/Home.dart';


class Incluir extends StatelessWidget{
  //const Cadastro({super.key});
  final _formKey = GlobalKey<FormState>();

  final  _categoriaController = TextEditingController();
  final  _valorController = TextEditingController();
  final  _dataController = TextEditingController();

  void showSuccessMessage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Cadastro Efetuado com sucesso!"),
        actions: <Widget>[
          ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, 'Gastos'), child: Text("Ok"))
        ],
      ),
    );
    Navigator.pop(context);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(title: const Text('Cadastro de Gastos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _categoriaController,
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
              controller: _valorController,
              decoration: InputDecoration(
                labelText: 'Digite o valor'
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite um valor';
                }
              },
            ),
            TextFormField(
              controller: _dataController,
              decoration: InputDecoration(
                labelText: 'Digite a data'
              ),keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite uma data';
                }
                return null;
              },
            ),
            ElevatedButton(child: const Text('Incluir'),
              onPressed: () {
                Route rota3 = MaterialPageRoute(builder: (context) => Gastos(),);
                  Navigator.pushNamed(context, 'Gastos');
                showSuccessMessage(context);
            },),
          ],
        ),
      )
    );
  }
}
