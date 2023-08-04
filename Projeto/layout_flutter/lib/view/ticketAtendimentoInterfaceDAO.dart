import '../conexao/dto/atendimentoTicket.dart';

abstract class AtendimentoTicketInterfaceDAO {
  Future<AtendimentoTicket> salvar(AtendimentoTicket atendimentoTicket);
  Future<AtendimentoTicket> consultar(int id);
  Future<bool> excluir(dynamic id);
  List<AtendimentoTicket>  consultarTodos();
  List<AtendimentoTicket> consultarTodosPorId(int idTicket);
}