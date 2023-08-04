import 'package:flutter/material.dart';
import 'package:layout_flutter/conexao/conexao.dart';
import 'package:layout_flutter/conexao/credenciais.dart';
import 'package:layout_flutter/conexao/dao/ticketDadosFake.dart';
import 'package:layout_flutter/conexao/dao/userDAO.dart';
import 'package:layout_flutter/conexao/dto/ticket.dart';
import 'package:layout_flutter/view/ticketInterfaceDAO.dart';
import 'package:layout_flutter/view/userInterfaceDAO.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../dto/user.dart';

class TicketDAO implements TicketInterfaceDAO{

    UserInterfacaDAO dao = UserDAO();
  
  @override
  Ticket consultar(int id) {

    Ticket ticket = tickets.firstWhere((ticket) => ticket.id == id, orElse: () => Ticket(id: -1, titulo: '',descricao: '',categoria: '',status: '',tipo: '',urgencia: '')); // Caso não encontre, retorna um User com ID inválido

    return ticket;
  }

  @override
  List<Ticket> consultarTodos() {
    return tickets;
  }

  @override
  Future<bool> excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  Ticket salvar(Ticket ticket) {

    if (ticket.id == null) {
      ticket = Ticket(id: tickets.length + 1,titulo: ticket.titulo, descricao: ticket.descricao, categoria: ticket.categoria, tipo: ticket.tipo, urgencia: ticket.urgencia, status: "Novo",idUser: ticket.idUser);
      tickets.add(ticket);
    } else {
      int t =(ticket.id as int) - 1;
      tickets[t] = ticket;
    }

    // print(ticket);
    return ticket;
  }

  List<Ticket> consultarTodosPorIdUser(int idUser) {
      List<Ticket> todosTickets = consultarTodos();

      List<Ticket> ticketsFiltrados =
          todosTickets.where((ticket) => ticket.idUser == idUser).toList();

      return ticketsFiltrados;

  }

  
//   @override
//   Future<List<Ticket>> consultarTodos() async {
//     Database db = await Conexao.criar();
//     List<Ticket> lista = (await db.query('ticket')).map<Ticket>(converterTicket).toList();
//     return lista;
//   }

//   @override
//   Future<Ticket> consultar(int id) async{
//     Database db = await Conexao.criar();
//     List<Map> maps = await db.query('Ticket', where: 'id = ?', whereArgs: [id]);
//     if (maps.isEmpty) throw Exception('Nenhum registro encontrado');
//     Map<dynamic,dynamic> resultado = maps.first;
//     return converterTicket(resultado);
//   }

//   @override
//   Future<bool> excluir(id) async{
//     Database db = await  Conexao.criar();
//     var sql ='DELETE FROM ticket WHERE id = ?';
//     int linhasAfetas = await db.rawDelete(sql, [id]);
//     return linhasAfetas > 0;
//   }

//   @override
//   Future<Ticket> salvar(Ticket ticket) async{
//     Database db = await  Conexao.criar();
//     String sql;
//     if(ticket.id == null){
//       sql = 'INSERT INTO ticket (nome, telefone,email,url_avatar) VALUES (?,?,?,?)';
//       int id = await db.rawInsert(sql,[ticket.titulo,ticket.descricao,ticket.categoria,ticket.tipo,ticket.urgencia]);
//       ticket = Ticket(
//         id: id,
//         titulo: ticket.titulo, 
//         descricao: ticket.descricao, 
//         categoria: ticket.categoria, 
//         tipo: ticket.tipo,
//         urgencia: ticket.urgencia);
//     }else{
//       sql = 'UPDATE ticket SET titulo = ?, descricao =?, categoria = ?, tipo= ?, urgencia= ?, WHERE id = ?';
//       db.rawUpdate(sql,[ticket.titulo, ticket.descricao, ticket.categoria, ticket.tipo, ticket.urgencia, ticket.id]);
//     }
//     return ticket;
//   }  
// }

//   Ticket converterTicket(Map<dynamic,dynamic> resultado){
//     return Ticket(
//       id : resultado['id'],
//       titulo: resultado['titulo'],
//       descricao: resultado['descricao'],
//       categoria: resultado['categoria'],
//       tipo:  resultado['tipo'],
//       urgencia:  resultado['urgencia']
//     );
  }