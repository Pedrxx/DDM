import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/Home.dart';

class Login extends StatelessWidget{
  //const Login({super.key});
  final _formKey = GlobalKey<FormState>();


  final  _emailController = TextEditingController();
  final  _senhaController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório!';
                }
              },
            ),
            TextFormField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha'
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite um valor';
                }
              },
            ),
            SizedBox(height: 50,),
            ElevatedButton(child: const Text('Entrar'),
            onPressed: () {
              Route rota = MaterialPageRoute(builder: (context) => Home(),);
            Navigator.pushReplacementNamed(context, 'Home');
            },),
          ],
        ),
      )
    );
  }
}
