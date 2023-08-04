import 'dart:html';

import 'package:flutter/material.dart';
import 'package:layout_flutter/conexao/dao/atendimentoTicketDAO.dart';
import 'package:layout_flutter/conexao/dao/ticketDAO.dart';
import 'package:layout_flutter/conexao/dto/atendimentoTicket.dart';
import 'package:layout_flutter/conexao/dto/ticket.dart';
import 'package:layout_flutter/telas/Home.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../conexao/credenciais.dart';
import '../conexao/dao/userDAO.dart';
import '../conexao/dto/user.dart';
import '../view/userInterfaceDAO.dart';

class ReabreTicket extends StatefulWidget {

  final int idTicket;

  ReabreTicket({required this.idTicket});

  @override
  _ReabreTicketState createState() => _ReabreTicketState();
}

class _ReabreTicketState extends State<ReabreTicket> {
  final _motivoController = TextEditingController();

  @override
  void dispose() {
    _motivoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reabrir'),
        backgroundColor: Color(0xFF0057A6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reaberir Ticket',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _motivoController,
              decoration: InputDecoration(
                hintText: 'Digite o motivo da reabertura',
                border: OutlineInputBorder(),
              ),
              maxLines: 4, // Permite várias linhas para a descrição
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Adicione aqui a lógica para salvar o atendimento
                    String descricao = _motivoController.text;
                    AtendimentoTicketDAO dao = AtendimentoTicketDAO();
                    TicketDAO daoTicket = TicketDAO();
                    var atendimento = _inserirAtendimento(descricao, widget.idTicket);
                    var ticket = _atualizaTicket(widget.idTicket);
                    daoTicket.salvar(ticket);
                    dao.salvar(atendimento);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  child: Text('Reabrir'),
                  style: ElevatedButton.styleFrom(primary: Colors.green)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
    AtendimentoTicket _inserirAtendimento(String descricao,int idTicket) {
    return AtendimentoTicket(detalhe: '(Reabertura) '+descricao, horaAtendimento: DateTime.timestamp(), idTicket: idTicket);
  } 

    Ticket _atualizaTicket(int idTicket) {
      // UserInterfacaDAO daoUser = UserDAO();
      // User usuario = daoUser.consultarPorNome(Provider.of<UserCredentials>(context as BuildContext).nome);

      TicketDAO dao = TicketDAO();
      Ticket ticket = dao.consultar(idTicket);
      
      return Ticket(id: ticket.id,titulo: ticket.titulo, descricao: ticket.descricao, categoria: ticket.categoria, tipo: ticket.tipo, urgencia: ticket.urgencia, status: 'Em Andamento', idUser: ticket.idUser);

  }     
}

