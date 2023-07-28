import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DescController extends StatelessWidget{

  final TextEditingController controle;
  const DescController({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))],
      decoration: InputDecoration(
        labelText: 'Descrição',
        hintText: 'Descrição detalhada'
      ), validator: (valorDigitado) {
        if(valorDigitado == null || valorDigitado.isEmpty) {
          return 'O campo é obrigatório';
        } return null;
      },
    );
  }
}