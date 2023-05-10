import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Formulario extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();


  var _nomeController = TextEditingController();
  var _sobrenomeController = TextEditingController();
  var _idadeController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Form(
        key: keyForm,
        child: Column(
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Informe o seu nome.'
              ),
              validator: (valorDigitado) {
                if(valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O campo é obrigatório';
                } return null;
              },
            ),
            TextFormField(
              controller: _sobrenomeController,
              decoration: InputDecoration(
                labelText: 'Sobrenome',
                hintText: 'Informe o seu sobrenome.'
              ),
              validator: (valorDigitado) {
                if(valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O campo é obrigatório';
                } return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 2,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _idadeController,
              decoration: InputDecoration(
                labelText: 'Idade',
                hintText: 'Informe sua idade'
              ),
                validator: (valorDigitado) {
                
                  var testaInt = int.tryParse(valorDigitado!) ?? null;
                  if(valorDigitado == null || valorDigitado.isEmpty) {
                    return 'O campo é obrigatório';
                  } else if(testaInt == null) {
                    return 'O campo deve ser numerico';
                  } 
                  return null;
                },
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                ElevatedButton(
                  child: Text('Inserir'),
                  onPressed: () {
                    if(keyForm.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Inserido: '+ _nomeController.text + ' ' + _sobrenomeController.text + ' | Idade: ' + _idadeController.text ))
                      );
                    }
                  },
                ) 
              ],
            ),
          ],
        ),
      )
    );
  }
}




