import 'package:flutter/material.dart';
import 'package:layout_flutter/conexao/dao/userDAO.dart';
import 'package:layout_flutter/view/userInterfaceDAO.dart';
import 'package:provider/provider.dart';

import '../conexao/credenciais.dart';
import '../conexao/dto/user.dart';
import 'Perfil.dart';

class PerfilAltera extends StatefulWidget {

  final String nome;
  final String email;
  final String setor;
  final String cargo;
  bool editarCampos;

  PerfilAltera({
    required this.nome,
    required this.email,
    required this.setor,
    required this.cargo,
    this.editarCampos = false,
  });

  @override
  _PerfilAlteraState createState() => _PerfilAlteraState();
}

class _PerfilAlteraState extends State<PerfilAltera> {
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
        title: Text('Alterar'),
        leading: BackButton(
          onPressed: () {
          Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Perfil(nome: _nomeController.text, email: _emailController.text, cargo: _cargoController.text, setor: _setorController.text),
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
            _campoTexto('Nome:', _nomeController, false),
            SizedBox(height: 12),
            _campoTexto('Email:', _emailController, true),
            SizedBox(height: 12),
            _campoTexto('Setor:', _setorController, true),
            SizedBox(height: 12),
            _campoTexto('Cargo:', _cargoController, true),
            SizedBox(height: 40),
            ElevatedButton(onPressed: () {
                UserInterfacaDAO dao = UserDAO();
                User user = _alteraUser();
                dao.salvar(user);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Perfil(nome: _nomeController.text, email: _emailController.text, cargo: _cargoController.text, setor: _setorController.text),
                  ),
                );
                
              }, 
              style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(16),
              primary: Colors.green,
            ),
            child: Icon(Icons.check, size: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
    
  }
  User _alteraUser() {
    UserInterfacaDAO dao = UserDAO();
    User user = dao.consultarPorNome(_nomeController.text);
    return User(
      id: user.id,
      nome: _nomeController.text,
      cargo: _cargoController.text,
      email: _emailController.text,
      setor: _setorController.text,
      senha: user.senha,
      acesso: user.acesso,
    );
  }

  Widget _campoTexto(String label, TextEditingController controller, bool enabled) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(labelText: label),
    );
  }
}




