import 'package:flutter/material.dart';
import 'package:layout_flutter/telas/Cadastro.dart';
import 'package:provider/provider.dart';

import '../conexao/credenciais.dart';
import '../conexao/dao/userDAO.dart';
import '../conexao/dto/user.dart';
import 'Home.dart';

class Inicio extends StatelessWidget {
  // const Inicio({super.key});
  final _formKey = GlobalKey<FormState>();


  final  _userController = TextEditingController();
  final  _senhaController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''),
      backgroundColor: Color(0xFF0057A6),
      leading: IconButton(icon: Icon(null),onPressed: () {},),),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
            'assets/images/p_1.png', // Substitua pelo nome da sua imagem
            width: 200, // Ajuste a largura conforme necessário
            height: 200, // Ajuste a altura conforme necessário
          ),
          Text(
            'Ao sistema de chamados Prats.',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Futura',
              color: Color(0xFF0057A6)
            ),),
            SizedBox(height: 25,),
            Container(
              width: 300,
              child: TextFormField(
                controller: _userController,
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
              ),
            ),
            Container(
              width: 300,
              child: TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(
                  labelText: 'Senha'
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  } return null;
                },
              ),
            ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF0057A6)),
                child: const Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String username = _userController.text;
                    String password = _senhaController.text;

                    UserDAO userDAO = UserDAO();

                    if (userDAO.validarSenha(username, password)) {
                      Provider.of<UserCredentials>(context, listen: false).logar(username, password);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );

                    } else {
                      // Senha inválida, mostrar mensagem de erro
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Erro'),
                          content: Text('Login ou Senha inválida.'),
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Color(0xFF0057A6)),
                              onPressed: () => Navigator.pop(context),
                              child: Text('Fechar'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
              SizedBox(width: 100,),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(0xFF0057A6)),child: const Text('Cadastro'),
              onPressed: () {
                Route rota2 = MaterialPageRoute(builder: (context) => Cadastro(),);
              Navigator.pushNamed(context, 'Cadastro');
                })
              ]
            )
          ],
        ),
      )
    );
  }



}