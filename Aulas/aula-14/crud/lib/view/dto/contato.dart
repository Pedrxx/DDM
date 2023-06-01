class Contato{
  final dynamic id;
  final String nome;
  final String telefone; 
  final String email; 
  final String urlAvatar;

  Contato({
    this.id, 
    required this.nome, 
    required this.telefone, 
    required this.email, 
    required this.urlAvatar
  });

  @override
  String toString() {
    return '''
      $id
      $nome 
      $telefone 
      $email
      $urlAvatar
    ''';
  }
}