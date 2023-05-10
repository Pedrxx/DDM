import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout_flutter/widgets/Gastos.dart';
import 'package:layout_flutter/widgets/Home.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const List<String> list = <String>['Posto de Gasolina', 'Mercado', 'PetShop', 'Barbeiro'];


class Incluir extends StatelessWidget{
  //const Cadastro({super.key});
  var _formKey = GlobalKey<FormState>();


  final  _categoriaController = TextEditingController();
  final  _valorController = TextEditingController();
  final  _dataController = TextEditingController();

  final _maskData = MaskTextInputFormatter(mask: '##/##/####');
  final _maskValor = MaskTextInputFormatter(mask: 'R\$ ####,##');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Gastos')),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _categoriaController,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
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
              inputFormatters: [_maskValor],
              decoration: InputDecoration(
                labelText: 'Digite o valor'
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório!';
                }
              },
            ),
            TextFormField(
              controller: _dataController,
              inputFormatters: [_maskData],
              decoration: InputDecoration(
                labelText: 'Digite a data'
              ),keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório!';
                }
              },
            ),
            ElevatedButton(child: const Text('Incluir'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Route rota = MaterialPageRoute(builder: (context) => Gastos(),);
                  Navigator.pushReplacementNamed(context, 'Gastos');
                  ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cadastro realizado !'))
                  );
                }
              },
            ),
          ],
        ),
      )
    );
  }
}
