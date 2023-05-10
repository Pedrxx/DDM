import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/cadastro.dart';

class Login extends StatelessWidget {
  const Login({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body:  ElevatedButton(child: const Text('Home'),
      onPressed: (){
        Navigator.pushNamed(context, 'Home');
      },), 
    );
  }
}