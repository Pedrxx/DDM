import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Home.dart';


class Cadastro extends StatelessWidget{
  //const Cadastro({super.key});
  final TextEditingController _textController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: ElevatedButton(child: const Text('Home'),
      onPressed: () {
        Route rota = MaterialPageRoute(builder: (context) => Home(),);
      Navigator.pushReplacementNamed(context, 'Home');
      },),
    );
  }
}
