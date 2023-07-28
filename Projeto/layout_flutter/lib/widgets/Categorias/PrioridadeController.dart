import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrioridadeController extends StatelessWidget{

  final TextEditingController controle;
  const PrioridadeController({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
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
    );
  }
}