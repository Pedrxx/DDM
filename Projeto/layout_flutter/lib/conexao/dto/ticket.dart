
class Ticket {

  final dynamic id;
  final String titulo;
  final String descricao; 
  final String categoria; 
  final String tipo;
  final String urgencia;
  final String status;
  final int? idUser;

  Ticket({
    this.id, 
    required this.titulo, 
    required this.descricao, 
    required this.categoria, 
    required this.tipo,
    required this.urgencia,
    required this.status,
    this.idUser,
  });

  @override
  String toString() {
    return '''
      $id
      $titulo 
      $descricao 
      $categoria
      $tipo
      $urgencia
      $status
      $idUser
    ''';
  }
}
