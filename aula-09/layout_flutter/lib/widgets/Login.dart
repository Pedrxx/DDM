import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Home.dart';

class Login extends StatelessWidget{
  const Login({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ElevatedButton(child: const Text('Home'),
      onPressed: () {
        Route rota = MaterialPageRoute(builder: (context) => Home(),);
      Navigator.pushReplacementNamed(context, 'Home');
      },),
    );
  }
  

}