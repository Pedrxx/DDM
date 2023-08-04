import 'package:layout_flutter/conexao/dto/ticket.dart';

List<Ticket> tickets = [
  Ticket(id: 1, titulo: "Erro na configuração de impressora", descricao: "Ao tentar instalar o driver da impressora apresenta um erro", categoria: 'Infraestrutura', tipo: 'Acidente', urgencia: 'Baixa',status: 'Novo',idUser: 2),
  Ticket(id: 2, titulo: "Relatório de Compras X Centro Custos", descricao: "Precido de um relatório que me draga os pedidos de compra por centro de custos", categoria: 'Protheus', tipo: 'Pedido', urgencia: 'Média',status: 'Em Andamento', idUser: 4),
  Ticket(id: 3, titulo: "Falha na transmissão de notas fiscias", descricao: "Tentei transmistir uma nota aprenta um erro no serviço do TSS", categoria: 'Protheus', tipo: 'Acidente', urgencia: 'Muito Alto',status: 'Encerrado', idUser: 2),
];