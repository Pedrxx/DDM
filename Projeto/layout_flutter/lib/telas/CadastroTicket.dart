import 'package:flutter/material.dart';
import 'package:layout_flutter/conexao/dao/ticketDAO.dart';
import 'package:layout_flutter/telas/Home.dart';
import 'package:layout_flutter/view/ticketInterfaceDAO.dart';
import 'package:provider/provider.dart';

import '../conexao/credenciais.dart';
import '../conexao/dao/userDAO.dart';
import '../conexao/dto/ticket.dart';
import '../conexao/dto/user.dart';
import '../view/userInterfaceDAO.dart';

class CadastroTicket extends StatefulWidget {
  @override
  _CadastroTicketsState createState() => _CadastroTicketsState();
}

class _CadastroTicketsState extends State<CadastroTicket> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  String _categoria = 'Infraestrutura';
  final TextEditingController _tipoController = TextEditingController(text: 'Pedido');
  final TextEditingController _urgenciaController = TextEditingController(text: 'Baixa');

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    _tipoController.dispose();
    _urgenciaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserInterfacaDAO daoUser = UserDAO();
    User usuario = daoUser.consultarPorNome(Provider.of<UserCredentials>(context).nome) as User;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0057A6),
        title: Text('Cadastro de Tickets'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite um título';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite uma descrição';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Categoria'),
                value: _categoria,
                items: ['Infraestrutura', 'Protheus'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _categoria = newValue ?? 'Infraestrutura';
                  });
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Tipo'),
                value: _tipoController.text,
                items: ['Pedido', 'Acidente'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  _tipoController.text = newValue ?? 'Pedido';
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Urgência'),
                value: _urgenciaController.text,
                items: ['Baixa', 'Média', 'Alta', 'Muito Alta'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  _urgenciaController.text = newValue ?? 'Baixa';
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('Salvar'),
                onPressed: () {
                  var formState = _formKey.currentState;
                  if (formState != null && formState.validate()) {
                    Ticket ticket = _inserirTicket(usuario);
                    TicketInterfaceDAO dao = TicketDAO();
                    dao.salvar(ticket);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  } 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Ticket _inserirTicket(User user) {
    return Ticket(
      titulo: _tituloController.text,
      descricao: _descricaoController.text,
      categoria: _categoria,
      tipo: _tipoController.text,
      urgencia: _urgenciaController.text,
      status: 'Novo',
      idUser: user.id,
    );
  }
}
