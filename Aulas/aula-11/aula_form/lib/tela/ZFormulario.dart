import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ZFormulario extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();

  var _CEPController = TextEditingController();
  final _CEPMask = MaskTextInputFormatter(mask: '#####-###');
  var _textWttXYController = TextEditingController();
  var _textOTNController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: keyForm,
        child: Column(
          children: [
            TextFormField(
              controller: _CEPController,
              inputFormatters: [_CEPMask],
              decoration: InputDecoration(
                labelText: 'CEP',
                hintText: 'Digite seu CEP '
              ),
            ),
            TextFormField(
              controller: _textWttXYController,
              inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'x|y|X|Y'))],
              decoration: InputDecoration(
                labelText: 'Texto sem X e Y'
              ),
            ),
            TextFormField(
              controller: _textOTNController,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z]'))],
              decoration: InputDecoration(
                labelText: 'Texto somente letras e numeros'
              ),
            ) 
          ],
        ),
      ),
    );
  }
}