import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NomeController extends StatelessWidget{

  final TextEditingController controle;
  const NomeController({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))],
      decoration: InputDecoration(
        labelText: 'Nome',
        hintText: 'Nome da Categoria'
      ), validator: (valorDigitado) {
        if(valorDigitado == null || valorDigitado.isEmpty) {
          return 'O campo é obrigatório';
        } return null;
      },
    );
  }
}