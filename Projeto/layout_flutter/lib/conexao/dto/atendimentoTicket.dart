
class AtendimentoTicket {

  final dynamic id;
  final String detalhe;
  final DateTime horaAtendimento;
  final int idTicket;

  AtendimentoTicket({
    this.id,
    required this.detalhe,
    required this.horaAtendimento,
    required this.idTicket,
  });

  String ToString() {
    return '''
      $id
      $detalhe
      $horaAtendimento
      $idTicket
    ''';
  }
}