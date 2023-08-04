import 'dart:html';

import 'package:flutter/material.dart';
import 'package:layout_flutter/conexao/dao/atendimentoTicketDAO.dart';
import 'package:layout_flutter/conexao/dao/ticketDAO.dart';
import 'package:layout_flutter/conexao/dto/atendimentoTicket.dart';
import 'package:layout_flutter/conexao/dto/ticket.dart';
import 'package:layout_flutter/telas/Home.dart';

class CadastroAtendimento extends StatefulWidget {

  final int idTicket;

  CadastroAtendimento({required this.idTicket});

  @override
  _CadastroAtendimentoState createState() => _CadastroAtendimentoState();
}

class _CadastroAtendimentoState extends State<CadastroAtendimento> {
  String _selectedOption = 'Paliativa';
  final _descricaoController = TextEditingController();

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Atendimento'),
        backgroundColor: Color(0xFF0057A6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Descrição de Atendimento',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _descricaoController,
              decoration: InputDecoration(
                hintText: 'Digite a descrição do atendimento',
                border: OutlineInputBorder(),
              ),
              maxLines: 4, // Permite várias linhas para a descrição
            ),
            SizedBox(height: 20),
            Text(
              'Tipo de Atendimento',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
              },
              items: <String>['Definitiva', 'Paliativa']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Adicione aqui a lógica para salvar o atendimento
                    String descricao = _descricaoController.text;
                    String tipoAtendimento = _selectedOption;
                    AtendimentoTicketDAO dao = AtendimentoTicketDAO();
                    TicketDAO daoTicket = TicketDAO();
                    var atendimento = _inserirAtendimento(descricao, widget.idTicket);
                    var ticket = _atualizaTicket(widget.idTicket,tipoAtendimento);
                    daoTicket.salvar(ticket);
                    dao.salvar(atendimento);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  child: Text('Salvar Atendimento'),
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
    return AtendimentoTicket(detalhe: descricao, horaAtendimento: DateTime.timestamp(), idTicket: idTicket);
  } 

    Ticket _atualizaTicket(int idTicket, String tipoAtendimento) {

      TicketDAO dao = TicketDAO();
      Ticket ticket = dao.consultar(idTicket);
      if (ticket.status == 'Novo' && tipoAtendimento == 'Definitiva') {
        return Ticket(id: ticket.id,titulo: ticket.titulo, descricao: ticket.descricao, categoria: ticket.categoria, tipo: ticket.tipo, urgencia: ticket.urgencia, status: 'Encerrado', idUser: ticket.idUser);
      } 
      else if (ticket.status == 'Em Andamento' && tipoAtendimento == 'Definitiva') {
        return Ticket(id: ticket.id,titulo: ticket.titulo, descricao: ticket.descricao, categoria: ticket.categoria, tipo: ticket.tipo, urgencia: ticket.urgencia, status: 'Encerrado', idUser: ticket.idUser);
      } else {
        return Ticket(id: ticket.id,titulo: ticket.titulo, descricao: ticket.descricao, categoria: ticket.categoria, tipo: ticket.tipo, urgencia: ticket.urgencia, status: 'Em Andamento', idUser: ticket.idUser);
      }
  }     
}

