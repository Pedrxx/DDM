import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class incluirCategorias extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();

  var _descController = TextEditingController();
  var _prioriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categorias")),
      body: Form(
        key: keyForm,
        child: Column(
          children: [
            TextFormField(
              controller: _descController,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))],
              decoration: InputDecoration(
                labelText: 'Descrição',
                hintText: 'Defina o nome da categoria'
              ), validator: (valorDigitado) {
                if(valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O campo é obrigatório';
                } return null;
              },
            ),
            TextFormField(
              controller: _prioriController,
              maxLength: 1,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[1-5]'))],
              decoration: InputDecoration(
                labelText: 'Prioridade',
                hintText: 'Defina a prioridade entre 1-5'
              ), validator: (valorDigitado) {
                if(valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O campo é obrigatório';
                } return null;
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if(keyForm.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_descController.text + ' Incluido | Prioridade: ' + _prioriController.text ))
                  );
                }
              }, 
              child: Text('Incluir'))
          ],
        ),
      ),
    );
  }
}