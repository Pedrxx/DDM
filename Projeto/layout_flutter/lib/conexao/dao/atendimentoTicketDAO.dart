
import 'package:layout_flutter/conexao/dao/atendimentoDadosFake.dart';
import 'package:layout_flutter/conexao/dto/atendimentoTicket.dart';

import '../../view/ticketAtendimentoInterfaceDAO.dart';

class AtendimentoTicketDAO extends AtendimentoTicketInterfaceDAO {  @override
  Future<AtendimentoTicket> consultar(int id) {
    return Future.value(AtendimentoTickets[id - 1]);
  }

  @override
  List<AtendimentoTicket> consultarTodos() {
    return AtendimentoTickets;
  }

  @override
  Future<bool> excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  Future<AtendimentoTicket> salvar(AtendimentoTicket atendimentoTicket) {
    if (atendimentoTicket.id == null) {
      atendimentoTicket = AtendimentoTicket(id: AtendimentoTickets.length,detalhe: atendimentoTicket.detalhe,horaAtendimento: DateTime.timestamp(),idTicket: atendimentoTicket.idTicket);
      AtendimentoTickets.add(atendimentoTicket);
    } else {
      int t =(atendimentoTicket.id as int) - 1;
      AtendimentoTickets[t] = atendimentoTicket;
    }

    print(atendimentoTicket);
    return Future.value(atendimentoTicket);
  }

  List<AtendimentoTicket> consultarTodosPorId(int idTicket) {
      List<AtendimentoTicket> todosAtendimentos = consultarTodos();

      List<AtendimentoTicket> atendimentosFiltrados =
          todosAtendimentos.where((atendimento) => atendimento.idTicket == idTicket).toList();

      return atendimentosFiltrados;

  }

}
