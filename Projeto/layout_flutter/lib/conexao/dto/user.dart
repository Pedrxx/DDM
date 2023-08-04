
class User {
  
  final dynamic id;
  final String nome;
  final String email;
  final String cargo;
  final String setor;
  final String senha;
  final String? acesso;

  User({
  this.id,
  required this.nome,
  required this.email,
  required this.cargo,
  required this.setor,
  required this.senha,
  this.acesso
  });

  @override
  String toString() {
    return ''' 
    $id
    $nome
    $email
    $cargo
    $setor
    $senha
    $acesso
    ''';
  }
}
