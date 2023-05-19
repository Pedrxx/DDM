
import 'package:flutter/material.dart';
import 'package:persistencia/view/dto/contato.dart';

class FotoContato extends StatelessWidget {
  final Contato contato;
  const FotoContato({required this.contato,Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String url = contato.urlAvatar;
    return (Uri.tryParse(url)!.isAbsolute) ?
       CircleAvatar(backgroundImage: NetworkImage(url))
        : const CircleAvatar(child: Icon(Icons.person));
  }
}