import 'package:flutter/material.dart';

class _FormField extends StatelessWidget {

  var _editorController = TextEditingController();
  String rotulo;

  _FormField({required this.rotulo});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _editorController,
      decoration: InputDecoration(
        labelText: rotulo,
        hintText: 'Digite seu $rotulo'
      ),
    );
  }
}