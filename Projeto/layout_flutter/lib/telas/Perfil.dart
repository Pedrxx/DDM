import 'package:flutter/material.dart';
import 'package:layout_flutter/conexao/dao/userDAO.dart';
import 'package:layout_flutter/telas/Home.dart';
import 'package:layout_flutter/telas/PerfilAltera.dart';
import 'package:layout_flutter/view/userInterfaceDAO.dart';
import 'package:provider/provider.dart';

import '../conexao/credenciais.dart';
import '../conexao/dto/user.dart';

class Perfil extends StatefulWidget {

  final String nome;
  final String email;
  final String setor;
  final String cargo;

  Perfil({
    required this.nome,
    required this.email,
    required this.setor,
    required this.cargo,
  });

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late TextEditingController _nomeController;
  late TextEditingController _emailController;
  late TextEditingController _setorController;
  late TextEditingController _cargoController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.nome);
    _emailController = TextEditingController(text: widget.email);
    _setorController = TextEditingController(text: widget.setor);
    _cargoController = TextEditingController(text: widget.cargo);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _setorController.dispose();
    _cargoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0057A6),
        title: Text('Perfil'),
        leading: BackButton(
        onPressed: () {
          Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF0057A6),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            _campoTexto('Nome:', _nomeController),
            SizedBox(height: 12),
            _campoTexto('Email:', _emailController),
            SizedBox(height: 12),
            _campoTexto('Setor:', _setorController),
            SizedBox(height: 12),
            _campoTexto('Cargo:', _cargoController),
            SizedBox(height: 40),
            ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfilAltera(nome: _nomeController.text, email: _emailController.text, cargo: _cargoController.text, setor: _setorController.text),
                  ),
                );
              }, 
              style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(16),
              primary: Colors.orange,
            ),
            child: Icon(Icons.edit, size: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
    
  }

  Widget _campoTexto(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      enabled: false,
      decoration: InputDecoration(labelText: label),
    );
  }
}




