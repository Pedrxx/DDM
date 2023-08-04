
import 'package:intl/intl.dart';
import 'package:layout_flutter/conexao/dto/atendimentoTicket.dart';

List<AtendimentoTicket> AtendimentoTickets = [
  AtendimentoTicket(id: 1,detalhe:  "O Relatórios esta na fila de desenvolvimento.", horaAtendimento: DateFormat('dd/MM/yyyy HH:mm').parse("25/07/2023 16:14"), idTicket: 2),
  AtendimentoTicket(id: 2,detalhe: "Foi Atualizado o serviço do TSS", horaAtendimento: DateFormat('dd/MM/yyyy HH:mm').parse("31/07/2023 13:53"), idTicket: 3),
  AtendimentoTicket(id: 3,detalhe:  "Relatório foi disponiblizado para validação.", horaAtendimento: DateFormat('dd/MM/yyyy HH:mm').parse("01/08/2023 10:27"), idTicket: 2),
];