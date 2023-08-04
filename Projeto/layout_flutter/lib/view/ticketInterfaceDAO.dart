import '../conexao/dto/ticket.dart';

abstract class TicketInterfaceDAO{
  Ticket salvar(Ticket ticket);
  Ticket consultar(int id);
  Future<bool> excluir(dynamic id);
  List<Ticket>  consultarTodos();

}